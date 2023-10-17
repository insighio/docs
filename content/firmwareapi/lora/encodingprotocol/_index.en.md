---
title: Encoding Protocol
identifier: "firmwareapi@lora@encodingprotocol"
parent: "firmwareapi@lora"
weight: 4510
---

insigh.io Firmware comes with a data encoding protocol that packs all information ready to be transmitted into a concise byte array. Currently it is used specifically to create the payload in case of LoRA transmission.

### packet composition

The payload always starts with the device_id which is the first 6 bytes, and follows a composition of sensor data fields.

| sensor data |               |               |     |               |
| :---------: | :-----------: | :-----------: | :-: | :-----------: |
|  device_id  | sensor_data_1 | sensor_data_2 | ... | sensor_data_n |

### sensor_data format

Each sensor data field is composed of one byte for **sensor type**, one byte for **sensor location** on the insigh.io board followed by the **sensor value** with 1-6 bytes of data. The number of sensor value bytes is in direct correspondence with the sensor type and can be retrieved in the table of the next paragraph.

|  byte [0]   |    byte [1]     |  byte [2-n]  |
| :---------: | :-------------: | :----------: |
| sensor type | sensor location | sensor value |

### sensor type values

| sensor type |                    name                    |        value range        |    unit     | divider | sensor value number of bytes |
| :---------: | :----------------------------------------: | :-----------------------: | :---------: | :-----: | :--------------------------: |
|    0x01     |                 device id                  |        hex string         |    text     |    -    |           6 bytes            |
|    0x02     |                reset cause                 |            0-4            |   integer   |    -    |            1 byte            |
|    0x03     |                   uptime                   |          0-65535          |     ms      |    -    |           2 bytes            |
|    0x04     |                 mem_alloc                  |      0 – 4294967295       |      B      |    -    |           4 btyes            |
|    0x05     |                  mem_free                  |      0 – 4294967295       |      B      |    -    |           4 btyes            |
|    0x07     |                  current                   |          0-65535          |     mA      |    -    |           2 bytes            |
|    0x08     |                   vbatt                    |          0-65535          |     mv      |    -    |           2 bytes            |
|    0x10     |                   light                    |          0-65535          |     lux     |    -    |           2 bytes            |
|    0x11     |             temperature (Cel)              |     -32767 -> +32767      |     Cel     |   100   |           2 bytes            |
|    0x12     |                  humidity                  |          0-10000          |      %      |   100   |           2 bytes            |
|    0x13     |                    co2                     |       0 – 1100 ppm        |     ppm     |    -    |           2 btyes            |
|    0x14     |                  pressure                  |             -             |     hPa     |    -    |           4 bytes            |
|    0x15     |                    gas                     |             -             |     ohm     |    -    |           2 bytes            |
|    0x16     |                  voltage                   |          0-65535          |      V      |    -    |           2 bytes            |
|    0x17     |       Volumetric Water Content (vwc)       |          0-10000          |      %      |   100   |           2 bytes            |
|    0x18     |      Relative Permittivity (rel_perm)      |          0-10000          |      %      |   100   |           2 bytes            |
|    0x19     |         Electric Conductivity (ec)         |          0-65535          |    uS/cm    |    -    |           2 bytes            |
|    0x1A     |              Millimeter (mm)               |          0-65535          |     mm      |    -    |           2 bytes            |
|    0x1B     |           Watts Per Square Meter           |          0-65535          |    W/m2     |    -    |           2 bytes            |
|    0x1C     | Grams of Water Vapour / Cubic metre of air |          0-65535          |    g.m3     |    -    |           2 bytes            |
|    0x1D     |       Actual Evapotranspiration (et)       |          0-65535          |     mm      |  1000   |           2 bytes            |
|    0x1E     |          Latent Energy Flux (le)           |          0-65535          |    W/m2     |   10    |           2 bytes            |
|    0x1F     |               Heat Flux (h)                |          0-65535          |    W/m2     |   10    |           2 bytes            |
|    0x20     |          Soil Pore Water EC (ec)           |          0-65535          |    uS/cm    |    -    |           2 bytes            |
|    0x21     |            Sap Flow (sap_flow)             |          0-65535          | litres/hour |   100   |           2 bytes            |
|    0x22     |             Heat Velocity (vh)             |          0-65535          |   cm/hour   |   100   |           2 bytes            |
|    0x23     |             Log Ratio (log_rt)             | -2147483648 to 2147483647 |      -      | 100000  |           4 bytes            |
|    0x24     |        Vapor Pressure Deficit (vpd)        |          0-65535          |     hPa     |   10    |           2 bytes            |
|    0x25     |         Atmospheric Pressure (pa)          |          0-65535          |     hPa     |   10    |           2 bytes            |
|    0x26     |              temperature (F)               |     -32767 -> +32767      |      F      |    -    |           2 bytes            |
|    0x30     |          formula / transformation          | -2147483648 to 2147483647 |      -      | 100000  |           4 bytes            |
|    0xC1     |             lora_join_duration             |          0-65535          |     ms      |    -    |           2 bytes            |
|    0xD0     |                  gps_hdop                  |           0-256           |      -      |   10    |            1 byte            |
|    0xD1     |                  gps_lat                   |    -9000000 to 9000000    |     lat     | 100000  |           4 bytes            |
|    0xD2     |                  gps_lon                   |   -18000000 to 18000000   |     lon     | 100000  |           4 bytes            |
|    0xE0     |                  generic                   | -2147483648 to 2147483647 |      -      |   100   |           4 bytes            |
|     ...     |                    ...                     |            ...            |      -      |   100   |           4 bytes            |
|    0xE9     |                  generic                   | -2147483648 to 2147483647 |      -      |   100   |           4 bytes            |

### sensor location values

| byte value |        location description        |
| :--------: | :--------------------------------: |
|    0x00    |              unknown               |
|    0x10    |               board                |
|    0x11    |                cpu                 |
|    0x20    |                i2c                 |
|    0x30    |      ap1 (Analog Position 1)       |
|    0x31    |      ap2 (Analog Position 2)       |
|    0x40    | adp1 (Analog / Digital Position 1) |
|    0x41    | adp2 (Analog / Digital Position 2) |
|    0x50    |          sdi12 Address 0           |
|    ...     |                ...                 |
|    0x59    |          sdi12 Address 9           |
|    0x60    |     Current 4-20mA Position 1      |
|    0x61    |     Current 4-20mA Position 2      |
|    0x70    |           Network modem            |
|    0x71    |             GPS modem              |

## Example

For example, lets incrementally build the required payload based on the following values:

1. device_id: 30aea47861b8

   - **payload**: 30aea47861b8

1. cpu_temperature: 44.44

   - type: temperature
   - type id: 0x11
   - location: cpu
   - location id: 0x11
   - value: 44.44
   - value encoded: 44.44 \* 100 => dec: 4444 => hex: 0x115c
   - **payload:** 0x1111115c

1. board_humidity: 55.95

   - type: humidity
   - type id: 0x12
   - location: board
   - location id: 0x10
   - value: 55.95
   - value encoded: 55.95 \* 100 => dec: 5595 => hex: 0x15DB
   - **payload:** 0x121015db

1. ap1_voltage: 144

   - type: voltage
   - type id: 0x16
   - location: ap1
   - location id: 0x30
   - value: 144
   - value encoded: dec: 144 => hex: 0x0090
   - **payload:** 0x16300090

Aggregated payload:

```
30aea47861b81111115c121015db16300090
```
