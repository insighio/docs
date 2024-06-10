---
title: Decoder
identifier: "firmwareapi@lora@decoder"
parent: "firmwareapi@lora"
weight: 4520
---

Follows the LoRA payload decoder that transforms received bytes into SenML-formatted message ready to be processed by insigh.io backend.

```js {linenos=true}
/*

/$$                     /$$           /$$           /$$
|__/                    |__/          | $$          |__/
/$$ /$$$$$$$   /$$$$$$$ /$$  /$$$$$$ | $$$$$$$      /$$  /$$$$$$
| $$| $$__  $$ /$$_____/| $$ /$$__  $$| $$__  $$    | $$ /$$__  $$
| $$| $$  \ $$|  $$$$$$ | $$| $$  \ $$| $$  \ $$    | $$| $$  \ $$
| $$| $$  | $$ \____  $$| $$| $$  | $$| $$  | $$    | $$| $$  | $$
| $$| $$  | $$ /$$$$$$$/| $$|  $$$$$$$| $$  | $$ /$$| $$|  $$$$$$/
|__/|__/  |__/|_______/ |__/ \____  $$|__/  |__/|__/|__/ \______/
                            /$$  \ $$
                            |  $$$$$$/
                            \______/

LoRA/Satellite payload decoder for insigh.io firmware (v2.1)
*/
var LOCATION_DEFAULT = 0x00
var LOCATION_INTERNAL_BOARD = 0x10
var LOCATION_INTERNAL_CPU = 0x11
var LOCATION_I2C = 0x20
var LOCATION_A_P1 = 0x30
var LOCATION_A_P2 = 0x31
var LOCATION_AD_P1 = 0x40
var LOCATION_AD_P2 = 0x41
var LOCATION_SDI12 = 0x50
var LOCATION_4_20 = 0x60
var LOCATION_MODEM = 0x70
var LOCATION_GPS = 0x71
var LOCATION_WEATHER_STATION = 0x80
var LOCATION_RAIN_GAUGE = 0x81
var LOCATION_SOLAR_SENSOR = 0x82
var LOCATION_PULSE_COUNTER = 0x83
var LOCATION_WEATHER_STATION_WIND = 0x84

var TYPE_DEVICE_ID = 0x01
var TYPE_RESET_CAUSE = 0x02
var TYPE_UPTIME = 0x03
var TYPE_MEM_ALLOC = 0x04
var TYPE_MEM_FREE = 0x05
var TYPE_CURRENT = 0x07
var TYPE_VBATT = 0x08
var TYPE_LIGHT_LUX = 0x10
var TYPE_TEMPERATURE_CEL = 0x11
var TYPE_HUMIDITY = 0x12
var TYPE_CO2 = 0x13
var TYPE_PRESSURE = 0x14
var TYPE_GAS = 0x15
var TYPE_VOLTAGE = 0x16
var TYPE_VWC = 0x17
var TYPE_REL_PERM = 0x18
var TYPE_SOIL_EC = 0x19
var TYPE_MILLIMETER = 0x1a
var TYPE_WATTS_PER_SQUARE_METER = 0x1b
var TYPE_GRAMS_OF_WATER_VAPOUR_PER_CUBIC_METRE_OF_AIR = 0x1c
var TYPE_ACTUAL_EVAPOTRANSPIRATION_MM = 0x1d
var TYPE_LATENT_ENERGY_FLUX = 0x1e
var TYPE_HEAT_FLUX = 0x1f
var TYPE_PORE_WATER_CONDUCT = 0x20
var TYPE_SAP_FLOW = 0x21
var TYPE_HEAT_VELOCITY = 0x22
var TYPE_LOG_RATIO = 0x23
var TYPE_VAPOR_PRESSURE_DEFICIT = 0x24
var TYPE_ATMOSPHERIC_PRESSURE = 0x25
var TYPE_TEMPERATURE_FAH = 0x26
var TYPE_DEVIATION = 0x27
var TYPE_RADIATION = 0x28
var TYPE_COUNT = 0x29
var TYPE_HEIGHT = 0x2a
var TYPE_PERIOD = 0x2b
var TYPE_NOISE = 0x2c
var TYPE_DIRECTION_DEG = 0x2d
var TYPE_DIRECTION_ID = 0x2e
var TYPE_SPEED = 0x2f
var TYPE_FORMULA = 0x30
var TYPE_LORA_JOIN_DUR = 0xc1
var TYPE_GPS_HDOP = 0xd0
var TYPE_GPS_LAT = 0xd1
var TYPE_GPS_LON = 0xd2
var TYPE_GENERIC = 0xe0
var TYPE_GENERIC_MAX = 0xef

var typeMap = {}

function TypeSetting(name, unit, byteLength, divider, isSigned) {
  return { name, unit, byteLength, divider, isSigned }
}

function init() {
  typeMap[TYPE_ACTUAL_EVAPOTRANSPIRATION_MM] = TypeSetting("et", "mm", 2, 1000, false)
  typeMap[TYPE_ATMOSPHERIC_PRESSURE] = TypeSetting("pa", "hPa", 2, 10, false)
  typeMap[TYPE_CO2] = TypeSetting("co2", "ppm", 2, 100, false)
  typeMap[TYPE_COUNT] = TypeSetting("count", "count", 2, 10, false)
  typeMap[TYPE_CURRENT] = TypeSetting("current", "mA", 2, 1, false)
  typeMap[TYPE_DEVIATION] = TypeSetting("deviation", "", 2, 100, true)
  typeMap[TYPE_DEVICE_ID] = TypeSetting("device_id", "", 1, 1, false)
  typeMap[TYPE_DIRECTION_DEG] = TypeSetting("direction_d", "deg", 2, 10, false)
  typeMap[TYPE_DIRECTION_ID] = TypeSetting("direction", "", 1, 1, false)
  typeMap[TYPE_FORMULA] = TypeSetting("formula", "", 4, 100000, true)
  typeMap[TYPE_GAS] = TypeSetting("gas", "Ohm", 2, 100, false)
  typeMap[TYPE_GENERIC] = TypeSetting("generic", "", 4, 100, true)
  typeMap[TYPE_GPS_HDOP] = TypeSetting("hdop", "", 1, 10, false)
  typeMap[TYPE_GPS_LAT] = TypeSetting("lat", "", 4, 100000, true)
  typeMap[TYPE_GPS_LON] = TypeSetting("lon", "", 4, 100000, true)
  typeMap[TYPE_GRAMS_OF_WATER_VAPOUR_PER_CUBIC_METRE_OF_AIR] = TypeSetting("water_vapour_sq_air", "g.m3", 2, 1, false)
  typeMap[TYPE_HEAT_FLUX] = TypeSetting("h", "W/m2", 2, 10, false)
  typeMap[TYPE_HEAT_VELOCITY] = TypeSetting("hv", "cm/h", 2, 100, false)
  typeMap[TYPE_HEIGHT] = TypeSetting("height", "mm", 2, 10, false)
  typeMap[TYPE_HUMIDITY] = TypeSetting("hum", "%RH", 2, 100, false)
  typeMap[TYPE_LATENT_ENERGY_FLUX] = TypeSetting("le", "W/m2", 2, 10, false)
  typeMap[TYPE_LIGHT_LUX] = TypeSetting("light_lux", "lx", 2, 1, false)
  typeMap[TYPE_LOG_RATIO] = TypeSetting("log_rt", "", 4, 100000, false)
  typeMap[TYPE_LORA_JOIN_DUR] = TypeSetting("lora_join_dur", "ms", 2, 1, false)
  typeMap[TYPE_MEM_ALLOC] = TypeSetting("mem_alloc", "B", 4, 1, false)
  typeMap[TYPE_MEM_FREE] = TypeSetting("mem_free", "B", 4, 1, false)
  typeMap[TYPE_MILLIMETER] = TypeSetting("millimeter", "mm", 2, 1, false) // deprecated
  typeMap[TYPE_NOISE] = TypeSetting("noise", "db", 2, 10, false)
  typeMap[TYPE_PERIOD] = TypeSetting("period", "s", 2, 10, false)
  typeMap[TYPE_PORE_WATER_CONDUCT] = TypeSetting("pore_water_conduct", "uS/cm", 2, 100, false)
  typeMap[TYPE_PRESSURE] = TypeSetting("pressure", "hPa", 4, 1, true)
  typeMap[TYPE_RADIATION] = TypeSetting("radiation", "", 2, 1, false)
  typeMap[TYPE_REL_PERM] = TypeSetting("rel_perm", "", 2, 100, false)
  typeMap[TYPE_RESET_CAUSE] = TypeSetting("reset_cause", "", 1, 1, false)
  typeMap[TYPE_SAP_FLOW] = TypeSetting("sap_flow", "l/h", 2, 100, false)
  typeMap[TYPE_SOIL_EC] = TypeSetting("soil_ec", "uS/cm", 2, 100, false)
  typeMap[TYPE_SPEED] = TypeSetting("speed", "m/s", 2, 100, true)
  typeMap[TYPE_TEMPERATURE_CEL] = TypeSetting("temp", "Cel", 2, 100, true)
  typeMap[TYPE_TEMPERATURE_FAH] = TypeSetting("temp", "f", 2, 100, true)
  typeMap[TYPE_UPTIME] = TypeSetting("uptime", "ms", 4, 1, false)
  typeMap[TYPE_VAPOR_PRESSURE_DEFICIT] = TypeSetting("vpd", "hPa", 2, 10, false)
  typeMap[TYPE_VBATT] = TypeSetting("vbatt", "mV", 2, 1, false)
  typeMap[TYPE_VOLTAGE] = TypeSetting("voltage", "mV", 2, 1, false)
  typeMap[TYPE_VWC] = TypeSetting("vwc", "", 2, 100, false)
  typeMap[TYPE_WATTS_PER_SQUARE_METER] = TypeSetting("wpsqm", "W/m2", 2, 1, false)
}

function uint32toInt32(bin) {
  var num = bin & 0xffffffff
  if (0x80000000 & num) num = num - 0x0100000000
  return num
}

function uint16toInt16(bin) {
  var num = bin & 0xffff
  if (0x8000 & num) num = num - 0x010000
  return num
}

function uint8toInt8(bin) {
  var num = bin & 0xffff
  if (0x80 & num) num = num - 0x0100
  return num
}

function bytesToHex(byteArray, from, to) {
  var s = ""
  for (var i = from; i < to; ++i) {
    s += ("0" + (byteArray[i] & 0xff).toString(16)).slice(-2)
  }
  return s
}

function getTypeName(typeId) {
  var typeInfo = undefined
  if (typeId >= TYPE_GENERIC && typeId <= TYPE_GENERIC_MAX) {
    typeInfo = { ...typeMap[TYPE_GENERIC] }
    typeInfo.name = typeInfo.name + "_" + (typeId & 0x0f)
  } else typeInfo = typeMap[typeId]
  if (typeInfo === undefined) return ""
  return typeInfo.name
}

function getTypeUnit(typeId) {
  var typeInfo = typeMap[typeId]
  if (typeInfo === undefined) return ""
  return typeInfo.unit
}

function getLocationName(locationId) {
  var mainLocation = locationId & 0xf0
  var subLocation = locationId & 0x0f
  switch (mainLocation) {
    case LOCATION_INTERNAL_BOARD:
      switch (subLocation) {
        case LOCATION_INTERNAL_BOARD & 0x0f:
          return "board"
        case LOCATION_INTERNAL_CPU & 0x0f:
          return "cpu"
        default:
          return "internal"
      }
    case LOCATION_I2C:
      switch (subLocation) {
        case 0x00:
          return "tsl2561"
        case 0x01:
          return "si7021"
        case 0x02:
          return "scd30"
        case 0x03:
          return "bme680"
        case 0x04:
          return "sht20"
        case 0x05:
          return "sht40"
        case 0x06:
          return "sunrise"
        default:
          return "i2c"
      }
    case LOCATION_A_P1:
      switch (subLocation) {
        case LOCATION_A_P1 & 0x0f:
          return "ap1"
        case LOCATION_A_P2 & 0x0f:
          return "ap2"
        default:
          return "ap"
      }
    case LOCATION_AD_P1:
      switch (subLocation) {
        case LOCATION_AD_P1 & 0x0f:
          return "adp1"
        case LOCATION_AD_P2 & 0x0f:
          return "adp2"
        default:
          return "adp"
      }
    case LOCATION_4_20:
      return "4-20_" + subLocation
    case LOCATION_SDI12:
      return "sdi12_" + subLocation
    case LOCATION_MODEM:
      switch (subLocation) {
        case LOCATION_GPS & 0x0f:
          return "gps"
        default:
          return "modem"
      }
    case LOCATION_WEATHER_STATION:
      switch (subLocation) {
        case LOCATION_PULSE_COUNTER & 0x0f:
          return "pcnt"
        case LOCATION_RAIN_GAUGE & 0x0f:
          return "rain_gauge"
        case LOCATION_SOLAR_SENSOR & 0x0f:
          return "solar"
        case LOCATION_WEATHER_STATION_WIND & 0x0f:
          return "wth_wind"
        default:
          return "wth"
      }
    default:
      //console.log("location not decoded: ", locationId, ", ", mainLocation, ", ", subLocation)
      return "generic"
  }
}

function getValidName(nameDict, original_name) {
  var j = undefined
  var name = undefined
  do {
    name = original_name
    if (j !== undefined) {
      name += "_" + j
      j++
    } else j = 1
  } while (nameDict[name]) //if key is used, consider it is sensor with multiple measurements
  return name
}

function base64ToArrayBuffer(base64) {
  //console.log("Decoding ", base64)
  var binary_string = atob(base64)
  var len = binary_string.length
  var bytes = new Uint8Array(len)
  for (var i = 0; i < len; i++) {
    bytes[i] = binary_string.charCodeAt(i)
  }
  return new Uint8Array(bytes.buffer)
}

function DecodeInsighioPackage(bytes, convertBytesFromBase64 = true) {
  try {
    init()

    var senml = []
    var nameDict = {}

    if (convertBytesFromBase64) bytes = base64ToArrayBuffer(bytes)

    var i = 6
    while (i < bytes.length) {
      var typeId = bytes[i++]
      var locationId = bytes[i++]
      var original_name = getLocationName(locationId) + "_" + getTypeName(typeId)
      var name = getValidName(nameDict, original_name)
      var obj = { n: name, u: getTypeUnit(typeId) }

      //console.log("typeid: ", typeId.toString(16), ", locationId: ", locationId.toString(16))
      //console.log("\toriginal_name: ", original_name, ", name:", name, ", obj:", obj)
      var typeSettings = typeMap[typeId]

      if (typeId >= TYPE_GENERIC && typeId <= TYPE_GENERIC_MAX) typeSettings = typeMap[TYPE_GENERIC]

      if (typeSettings) {
        //console.log("\tusing setting: ", typeSettings)

        obj.v = 0
        // extract value
        for (var j = 1; j <= typeSettings.byteLength; j++) {
          var places = (typeSettings.byteLength - j) * 8
          if (places) obj.v |= bytes[i++] << places
          else obj.v |= bytes[i++]
        }

        // apply signedness
        if (typeSettings.isSigned) {
          switch (typeSettings.byteLength) {
            case 1:
              obj.v = uint8toInt8(obj.v)
              break
            case 2:
              obj.v = uint16toInt16(obj.v)
              break
            case 4:
              obj.v = uint32toInt32(obj.v)
              break
            default:
              break
          }
        }

        // apply divider
        obj.v /= typeSettings.divider
      }

      if (obj.v === undefined) obj.v = 0

      nameDict[obj.n] = true

      senml.push(obj)
      //console.log("\n")
    }

    if (senml.length > 0) {
      senml[0].bn = bytesToHex(bytes, 0, 6) + "-"
    }
  } catch (err) {
    //console.log("something went wrong", err)
    return { e: err.stack }
  }

  return senml
}

// Called from ChirpStack / LoRaServer
//https://www.chirpstack.io/application-server/use/device-profiles/
function Decode(fPort, bytes, variables) {
  return DecodeInsighioPackage(bytes, true)
}

// Called from TheThingsNetwork
function decodeUplink(input) {
  return {
    data: {
      bytes: DecodeInsighioPackage(input.bytes, false),
    },
  }
}
```
