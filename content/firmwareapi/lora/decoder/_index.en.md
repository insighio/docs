---
title: Decoder
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

LoRA payload decoder for insigh.io firmware
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
var LOCATION_MODEM = 0x70;

var TYPE_DEVICE_ID = 0x01;
var TYPE_RESET_CAUSE = 0x02;
var TYPE_UPTIME = 0x03;
var TYPE_MEM_ALLOC = 0x04;
var TYPE_MEM_FREE = 0x05;
var TYPE_CURRENT = 0x07;
var TYPE_VBAT = 0x08;
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
var TYPE_LORA_JOIN_DUR = 0xc1;
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
  typeMap[TYPE_VBAT] = { name: "vbat", unit: "mV" };
  typeMap[TYPE_VOLTAGE] = { name: "voltage", unit: "mV" };
  typeMap[TYPE_VWC] = { name: "vwc", unit: "" };
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
    (bytes[startIndex] << 24) |
    (bytes[startIndex + 1] << 16) |
    (bytes[startIndex + 2] << 8) |
    bytes[startIndex + 3]
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
    case LOCATION_SDI12:
      return "sdi12_" + subLocation;
    case LOCATION_MODEM:
      return "modem";
    default:
      console.log(
        "location not decoded: ",
        locationId,
        ", ",
        mainLocation,
        ", ",
        subLocation
      );
      return "undefined";
  }
}

function DecodeInsighioPackage(bytes) {
  try {
    init();

    var senml = [];
    var i;
    for (var i = 6; i < bytes.length; i++) {
      var name = getLocationName(bytes[i + 1]) + "_" + getTypeName(bytes[i]);
      var obj = { n: name, u: getTypeUnit(bytes[i]) };
      var processed = true;
      switch (bytes[i]) {
        case TYPE_RESET_CAUSE: // 1 byte (unsigned char)
          obj.v = bytes[i + 2];
          i += 2;
          break;
        case TYPE_TEMPERATURE: // 2 bytes (signed short)
          var temp = (bytes[i + 2] << 8) | bytes[i + 3];
          obj.v = bin16dec(temp) / 100;
          i += 3;
          break;
        case TYPE_VBAT: // 2 bytes (unsigned short)
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
        default:
          processed = false;
      }
      if (!processed && bytes[i] & TYPE_GENERIC) {
        var temp = extract32bitInteger(bytes, i + 2);
        obj.v = bin32dec(temp) / 100;
        i += 5;
      }

      senml.push(obj);
    }
    if (senml.length > 0) {
      senml[0].bn = bytesToHex(bytes, 0, 6) + "-";
    }
  } catch (err) {
    return { e: err.stack };
  }

  return senml;
}

// Called from ChirpStack / LoRaServer
//https://www.chirpstack.io/application-server/use/device-profiles/
function Decode(fPort, bytes, variables) {
  return DecodeInsighioPackage(bytes);
}

// Called from TheThingsNetwork
function Decoder(bytes, port) {
  return DecodeInsighioPackage(bytes);
}
```
