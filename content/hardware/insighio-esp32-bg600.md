---
title: insigh.io generic board
identifier: "hardware@insighio-board-generic"
parent: "hardware"
weight: 210
---

![TAT image](/images/deviceimages/esp32-bg600_v1.png?width=50pc)

### General Information

|                            |
| :------------------------- | :---------------- |
| **Dimensions (L x W x H)** (including ESP32 WiFi antenna) | 83.5 x 57.2 x 13 mm |
| **Dimensions (L x W x H)** | 78 x 57.2 x 13 mm |
| **Weight**                 | 25 g              |
| **Enclosure**              | IP65/IP67         |

### Power Supply

|                 |                                                                  |                                      |      |      |       |
| --------------- | ---------------------------------------------------------------- | ------------------------------------ | ---- | ---- | ----- |
| **USB**         | **Port**                                                         | **Input Voltage**                    |
|                 | Micro USB                                                        | Min.                                 | Typ. | Max. | Units |
|                 |                                                                  | 4.5                                  | 5    | 5.5  | V     |
| **Battery**     | **Port**                                                         | **Nominal Characteristics**          |
|                 | JST                                                              | 1 x Rechargeable LiPo 1S1C 3.7-4.2 V |
| **Solar Panel** | **Port**                                                         | **Input Voltage**                    |
|                 | Fixed Terminal Block with push-in connection (no tools required) | Min.                                 | Typ. | Max. | Units |
|                 |                                                                  | 5.5                                  | 6    | 6.5  | V     |

### Operating Conditions

|                             |          |
| :-------------------------- | :------- |
| **Operational Temperature** | 0 – 60 C |
| **Charging Current Limit**  | 400 mA   |
| **Maximum Drawn Current**   | 3 A   |
| **Charging Temperature**    | 0 – 60 C |

### Charging State Indication (LEDs)

| Charge cycle state          | LCR |
| :-------------------------- | :-- |
| **Shutdown state 1**        | OFF |
| **Shutdown state 2**        | ON  |
| **Preconditioning**         | ON  |
| **Constant current**        | ON  |
| **Constant voltage**        | ON  |
| **Charge complete-standby** | ON  |
| **Temperature fault**       | BLINKING  |
| **Timer fault**             | ON  |
| **Low battery**             | OFF |
| **No battery**              | BLINKING |
| **No input**                | OFF |

### Switches

| Switch Name | Details                                                                                      |
| :---------- | :------------------------------------------------------------------------------------------- |
| **S1**      | Controls power supply to the micro-controller (the battery charging process is not affected) |
| **S2**      | Tactile switch for resetting the micro-controller |
| **S3**      | Tactile switch for activating the micro-controller’s bootloader (needed only for fw upgrade) |
| **EXT SW**  | Physical latching button connector to control micro-controller's power (the battery charging process is not affected) |
| **SNSR**    | Software-controlled switch for enabling/disabling power supply to sensors on-demand          |

### Communication

- **Wireless technologies**
  - WiFi
  - Bluetooth
  - GSM / NB-IoT/LTE-M
- **IP-based protocols**
  - TCP/UDP over IPv4/IPv6
  - MQTT
  - CoAP

### Sensors Support (Hardware & Software)

|                                |                                                                                    |
| :----------------------------- | :--------------------------------------------------------------------------------- |
| **On-board Sensors**           | 1 x Temperature/Humidity Sensor (based on the SI7021 chip)                         |
| **Number of External Sensors** | Up to 2 (simultaneously)                                                           |
| **External Sensor Interfaces** | Analogue @ 3.3V                                                                    |
|                                | Digital: 1-wire @ 3.3V                                                             |
|                                | ===load cell interface (find name)===                                              |
| **Low energy operation**       | Software-controlled                                                                |
| **Sensor models sw support**   | 1-wire: DS18B20 (Outdoor Temperature)                                              |
|                                | Weight Scale - Load Cell |

### Energy Consumption Profiling

|                     |                                                                                 |
| :------------------ | :------------------------------------------------------------------------------ |
| **Battery Voltage** | Accurate Measurement of battery voltage even at charging state                  |

### External components required/recommended

- **Microcontroller**
  - ESP32
- **Modem Connectivity**
  - Quectel BG600-M3 (GSM / NB-IoT / LTE-M)
- **Battery**
  - 2200-4000 mAh
- **Solar Panel**
  - 6V/1W

### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |
