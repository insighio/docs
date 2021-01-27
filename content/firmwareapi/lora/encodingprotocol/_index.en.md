---
title: Encoding Protocol
weight: 162
#pre: "<b>2. </b>"
---

```js
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

const LOCATION_DEFAULT = 0x00;
const LOCATION_INTERNAL_BOARD = 0x10;
const LOCATION_INTERNAL_CPU = 0x11;
const LOCATION_I2C = 0x20;
const LOCATION_A_P1 = 0x30;
const LOCATION_A_P2 = 0x31;
const LOCATION_AD_P1 = 0x40;
const LOCATION_AD_P2 = 0x41;
const LOCATION_SDI12 = 0x50;
const LOCATION_MODEM = 0x70;

const TYPE_DEVICE_ID = 0x01;
const TYPE_RESET_CAUSE = 0x02;
const TYPE_UPTIME = 0x03;
const TYPE_MEM_ALLOC = 0x04;
const TYPE_MEM_FREE = 0x05;
const TYPE_CURRENT = 0x07;
const TYPE_VBAT = 0x08;
const TYPE_LIGHT_LUX = 0x10;
const TYPE_TEMPERATURE = 0x11;
const TYPE_HUMIDITY = 0x12;
const TYPE_CO2 = 0x13;
const TYPE_PRESSURE = 0x14;
const TYPE_GAS = 0x15;
const TYPE_VOLTAGE = 0x16;
const TYPE_VWC = 0x17;
const TYPE_REL_PERM = 0x18;
const TYPE_SOIL_EC = 0x19;
const TYPE_PORE_WATER_CONDUCT = 0x20;
const TYPE_LORA_JOIN_DUR = 0xc1;

let typeMap = {};

function init() {
  typeMap[TYPE_CO2] = { name: "co2", unit: "ppm" };
  typeMap[TYPE_CURRENT] = { name: "current", unit: "mA" };
  typeMap[TYPE_DEVICE_ID] = { name: "device_id", unit: "" };
  typeMap[TYPE_GAS] = { name: "gas", unit: "Ohm" };
  typeMap[TYPE_HUMIDITY] = { name: "humidity", unit: "%RH" };
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

function bytesToHex(byteArray) {
  return Array.from(byteArray, function (byte) {
    return ("0" + (byte & 0xff).toString(16)).slice(-2);
  }).join("");
}

function getTypeName(typeId) {
  var typeInfo = typeMap[typeId];
  if (typeInfo === undefined) return "";
  return typeInfo.name;
}

function getTypeUnit(typeId) {
  var typeInfo = typeMap[typeId];
  if (typeInfo === undefined) return "";
  return typeInfo.unit;
}

function getLocationName(locationId) {
  mainLocation = locationId & 0xf0;
  subLocation = locationId & 0x0f;
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
  init();

  var senml = [];
  for (i = 6; i < bytes.length; i++) {
    var name = getLocationName(bytes[i + 1]) + "_" + getTypeName(bytes[i]);
    var obj = { n: name, u: getTypeUnit(bytes[i]) };
    switch (bytes[i]) {
      case TYPE_RESET_CAUSE: // 1 byte (unsigned char)
        obj["v"] = bytes[i + 2];
        i += 2;
        break;
      case TYPE_TEMPERATURE: // 2 bytes (signed short)
        var temp = (bytes[i + 2] << 8) | bytes[i + 3];
        obj["v"] = bin16dec(temp) / 100;
        i += 3;
        break;
      case TYPE_VBAT: // 2 bytes (unsigned short)
      case TYPE_CURRENT:
      case TYPE_LIGHT_LUX:
      case TYPE_LORA_JOIN_DUR:
        obj["v"] = (bytes[i + 2] << 8) | bytes[i + 3];
        i += 3;
        break;
      case TYPE_HUMIDITY: // 2 bytes (unsigned short)
      case TYPE_CO2:
      case TYPE_GAS:
      case TYPE_VOLTAGE:
      case TYPE_VWC:
      case TYPE_REL_PERM:
      case TYPE_SOIL_EC:
      case TYPE_PORE_WATER_CONDUCT:
        obj["v"] = ((bytes[i + 2] << 8) | bytes[i + 3]) / 100;
        i += 3;
        break;
      case TYPE_UPTIME: // 4 bytes (unsigned integer)
      case TYPE_MEM_ALLOC:
      case TYPE_MEM_FREE:
        obj["v"] =
          (bytes[i + 2] << 24) |
          (bytes[i + 3] << 16) |
          (bytes[i + 4] << 8) |
          bytes[i + 5];
        i += 5;
        break;
      case TYPE_PRESSURE: // 4 bytes (signed integer)
        var temp =
          (bytes[i + 2] << 24) |
          (bytes[i + 3] << 16) |
          (bytes[i + 4] << 8) |
          bytes[i + 5];
        obj["v"] = bin32dec(temp);
        i += 5;
        break;
      default:
        console.log("unidentified: ", bytes[i]);
    }
    senml.push(obj);
  }
  if (senml.length > 0) {
    senml[0]["bn"] = bytesToHex(bytes.splice(0, 6)) + "-";
  }

  return senml;
}

// Called from ChirpStack
function Decode(fPort, bytes) {
  return DecodeInsighioPackage(bytes);
}

// Called from TheThingsNetwork
function Decoder(bytes, port) {
  return DecodeInsighioPackage(bytes);
}
```
