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

LoRA/Satellite payload decoder for insigh.io firmware
*/

var LOCATION_DEFAULT = 0x00;
var LOCATION_INTERNAL_BOARD = 0x10;
var LOCATION_INTERNAL_CPU = 0x11;
var LOCATION_I2C = 0x20;
var LOCATION_A_P1 = 0x30;
var LOCATION_A_P2 = 0x31;
var LOCATION_AD_P1 = 0x40;
var LOCATION_AD_P2 = 0x41;
var LOCATION_SDI12 = 0x50;
var LOCATION_4_20 = 0x60;
var LOCATION_MODEM = 0x70;
var LOCATION_GPS = 0x71;

var TYPE_DEVICE_ID = 0x01;
var TYPE_RESET_CAUSE = 0x02;
var TYPE_UPTIME = 0x03;
var TYPE_MEM_ALLOC = 0x04;
var TYPE_MEM_FREE = 0x05;
var TYPE_CURRENT = 0x07;
var TYPE_VBATT = 0x08;
var TYPE_LIGHT_LUX = 0x10;
var TYPE_TEMPERATURE = 0x11;
var TYPE_HUMIDITY = 0x12;
var TYPE_CO2 = 0x13;
var TYPE_PRESSURE = 0x14;
var TYPE_GAS = 0x15;
var TYPE_VOLTAGE = 0x16;
var TYPE_VWC = 0x17;
var TYPE_REL_PERM = 0x18;
var TYPE_SOIL_EC = 0x19;
var TYPE_PORE_WATER_CONDUCT = 0x20;
var TYPE_SAP_FLOW = 0x21;
var TYPE_HEAT_VELOCITY = 0x22;
var TYPE_LOG_RATIO = 0x23;
var TYPE_FORMULA = 0x30;
var TYPE_LORA_JOIN_DUR = 0xc1;
var TYPE_GPS_HDOP = 0xd0;
var TYPE_GPS_LAT = 0xd1;
var TYPE_GPS_LON = 0xd2;
var TYPE_GENERIC = 0xe0;
var TYPE_GENERIC_MAX = 0xef;

var typeMap = {};

function init() {
  typeMap[TYPE_CO2] = { name: "co2", unit: "ppm" };
  typeMap[TYPE_CURRENT] = { name: "current", unit: "mA" };
  typeMap[TYPE_DEVICE_ID] = { name: "device_id", unit: "" };
  typeMap[TYPE_GAS] = { name: "gas", unit: "Ohm" };
  typeMap[TYPE_GENERIC] = { name: "gen", unit: "" };
  typeMap[TYPE_HEAT_VELOCITY] = { name: "hv", unit: "cm/h" };
  typeMap[TYPE_HUMIDITY] = { name: "humidity", unit: "%RH" };
  typeMap[TYPE_LOG_RATIO] = { name: "log_rt", unit: "" };
  typeMap[TYPE_FORMULA] = { name: "formula", unit: "" };
  typeMap[TYPE_LIGHT_LUX] = { name: "light_lux", unit: "lx" };
  typeMap[TYPE_LORA_JOIN_DUR] = { name: "lora_join_dur", unit: "ms" };
  typeMap[TYPE_MEM_ALLOC] = { name: "mem_alloc", unit: "B" };
  typeMap[TYPE_MEM_FREE] = { name: "mem_free", unit: "B" };
  typeMap[TYPE_PORE_WATER_CONDUCT] = {
    name: "pore_water_conduct",
    unit: "uS/cm",
  };
  typeMap[TYPE_PRESSURE] = { name: "pressure", unit: "hPa" };
  typeMap[TYPE_REL_PERM] = { name: "rel_perm", unit: "" };
  typeMap[TYPE_RESET_CAUSE] = { name: "reset_cause", unit: "" };
  typeMap[TYPE_SAP_FLOW] = { name: "sap_flow", unit: "l/h" };
  typeMap[TYPE_SOIL_EC] = { name: "soil_ec", unit: "uS/cm" };
  typeMap[TYPE_TEMPERATURE] = { name: "temperature", unit: "Cel" };
  typeMap[TYPE_UPTIME] = { name: "uptime", unit: "ms" };
  typeMap[TYPE_VBATT] = { name: "vbatt", unit: "mV" };
  typeMap[TYPE_VOLTAGE] = { name: "voltage", unit: "mV" };
  typeMap[TYPE_VWC] = { name: "vwc", unit: "" };
  typeMap[TYPE_GPS_HDOP] = { name: "hdop", unit: "" };
  typeMap[TYPE_GPS_LAT] = { name: "lat", unit: "" };
  typeMap[TYPE_GPS_LON] = { name: "lon", unit: "" };
}

function bin32dec(bin) {
  var num = bin & 0xffffffff;
  if (0x100000000 & num) num = -(0x0100000000 - num);
  return num;
}

function bin16dec(bin) {
  var num = bin & 0xffff;
  if (0x8000 & num) num = -(0x010000 - num);
  return num;
}

function bytesToHex(byteArray, from, to) {
  var s = "";
  for (var i = from; i < to; ++i) {
    s += ("0" + (byteArray[i] & 0xff).toString(16)).slice(-2);
  }
  return s;
}

function getTypeName(typeId) {
  var typeInfo = undefined;
  if (typeId >= TYPE_GENERIC && typeId <= TYPE_GENERIC_MAX) {
    typeInfo = typeMap[TYPE_GENERIC];
    typeInfo.name = typeInfo.name + "_" + (typeId & 0x0f);
  } else typeInfo = typeMap[typeId];
  if (typeInfo === undefined) return "";
  return typeInfo.name;
}

function getTypeUnit(typeId) {
  var typeInfo = typeMap[typeId];
  if (typeInfo === undefined) return "";
  return typeInfo.unit;
}

function extract32bitInteger(bytes, startIndex) {
  return (
    (bytes[startIndex] << 24) | (bytes[startIndex + 1] << 16) | (bytes[startIndex + 2] << 8) | bytes[startIndex + 3]
  );
}

function getLocationName(locationId) {
  var mainLocation = locationId & 0xf0;
  var subLocation = locationId & 0x0f;
  switch (mainLocation) {
    case LOCATION_INTERNAL_BOARD:
      switch (subLocation) {
        case 0x00:
          return "board";
        case 0x01:
          return "cpu";
        default:
          return "internal";
      }
    case LOCATION_I2C:
      switch (subLocation) {
        case 0x00:
          return "tsl2561";
        case 0x01:
          return "si7021";
        case 0x02:
          return "scd30";
        case 0x03:
          return "bme680";
        case 0x04:
          return "sht20";
        case 0x05:
          return "sht40";
        case 0x06:
          return "sunrise";
        default:
          return "i2c";
      }
    case LOCATION_A_P1:
      switch (subLocation) {
        case 0x00:
          return "ap1";
        case 0x01:
          return "ap2";
        default:
          return "ap";
      }
    case LOCATION_AD_P1:
      switch (subLocation) {
        case 0x00:
          return "adp1";
        case 0x01:
          return "adp2";
        default:
          return "adp";
      }
    case LOCATION_4_20:
      return "4-20_" + subLocation;
    case LOCATION_SDI12:
      return "sdi12_" + subLocation;
    case LOCATION_MODEM:
      switch (subLocation) {
        case 0x01:
          return "gps";
        default:
          return "modem";
      }
    default:
      //console.log("location not decoded: ", locationId, ", ", mainLocation, ", ", subLocation)
      return "undefined";
  }
}

function getValidName(nameDict, original_name) {
  var j = undefined;
  var name = undefined;
  do {
    name = original_name;
    if (j !== undefined) {
      name += "_" + j;
      j++;
    } else j = 1;
  } while (nameDict[name]); //if key is used, consider it is sensor with multiple measurements
  return name;
}

function base64ToArrayBuffer(base64) {
  //console.log("Decoding ", base64)
  var binary_string = atob(base64);
  var len = binary_string.length;
  var bytes = new Uint8Array(len);
  for (var i = 0; i < len; i++) {
    bytes[i] = binary_string.charCodeAt(i);
  }
  return new Uint8Array(bytes.buffer);
}

function DecodeInsighioPackage(bytes, convertBytesFromBase64 = true) {
  try {
    init();

    var senml = [];
    var nameDict = {};

    if (convertBytesFromBase64) bytes = base64ToArrayBuffer(bytes);

    for (var i = 6; i < bytes.length; i++) {
      var original_name = getLocationName(bytes[i + 1]) + "_" + getTypeName(bytes[i]);
      var name = getValidName(nameDict, original_name);
      var obj = { n: name, u: getTypeUnit(bytes[i]) };

      //console.log("original_name: ", original_name, ", name:", name, ", obj:", obj)
      var processed = true;
      switch (bytes[i]) {
        case TYPE_RESET_CAUSE: // 1 byte (unsigned char)
          obj.v = bytes[i + 2];
          i += 2;
          break;
        case TYPE_GPS_HDOP: // 1 byte (unsigned char)
          obj.v = bytes[i + 2] / 10;
          i += 2;
          break;
        case TYPE_TEMPERATURE: // 2 bytes (signed short)
          var temp = (bytes[i + 2] << 8) | bytes[i + 3];
          obj.v = bin16dec(temp) / 100;
          i += 3;
          break;
        case TYPE_VBATT: // 2 bytes (unsigned short)
        case TYPE_CURRENT:
        case TYPE_LIGHT_LUX:
        case TYPE_LORA_JOIN_DUR:
        case TYPE_VOLTAGE:
          obj.v = (bytes[i + 2] << 8) | bytes[i + 3];
          i += 3;
          break;
        case TYPE_HUMIDITY: // 2 bytes (unsigned short)
        case TYPE_CO2:
        case TYPE_GAS:
        case TYPE_VWC:
        case TYPE_REL_PERM:
        case TYPE_SOIL_EC:
        case TYPE_PORE_WATER_CONDUCT:
        case TYPE_SAP_FLOW:
        case TYPE_HEAT_VELOCITY:
          obj.v = ((bytes[i + 2] << 8) | bytes[i + 3]) / 100;
          i += 3;
          break;
        case TYPE_UPTIME: // 4 bytes (unsigned integer)
        case TYPE_MEM_ALLOC:
        case TYPE_MEM_FREE:
          obj.v = extract32bitInteger(bytes, i + 2);
          i += 5;
          break;
        case TYPE_LOG_RATIO:
          obj.v = extract32bitInteger(bytes, i + 2) / 100000;
          i += 5;
          break;
        case TYPE_PRESSURE: // 4 bytes (signed integer)
          var temp = extract32bitInteger(bytes, i + 2);
          obj.v = bin32dec(temp);
          i += 5;
          break;
        case TYPE_FORMULA:
        case TYPE_GPS_LAT: // 4 bytes (signed integer)
        case TYPE_GPS_LON:
          var temp = extract32bitInteger(bytes, i + 2);
          obj.v = bin32dec(temp) / 100000;
          i += 5;
          break;
        default:
          processed = false;
      }
      if (!processed && bytes[i] & TYPE_GENERIC) {
        var temp = extract32bitInteger(bytes, i + 2);
        obj.v = bin32dec(temp) / 100;
        i += 5;
      }

      nameDict[obj.n] = true;
      senml.push(obj);
    }
    if (senml.length > 0) {
      senml[0].bn = bytesToHex(bytes, 0, 6) + "-";
    }
  } catch (err) {
    //console.log("something went wrong", err)
    return { e: err.stack };
  }

  return senml;
}

// Called from ChirpStack / LoRaServer
//https://www.chirpstack.io/application-server/use/device-profiles/
function Decode(fPort, bytes, variables) {
  return DecodeInsighioPackage(bytes, true);
}

// Called from TheThingsNetwork
function decodeUplink(input) {
  return {
    data: {
      bytes: DecodeInsighioPackage(input.bytes, false),
    },
  };
}
```
