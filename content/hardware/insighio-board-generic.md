---
title: insigh.io generic board
identifier: "hardware@insighio-board-generic"
parent: "hardware"
weight: 210
---

![TAT image](/images/deviceimages/generic-board.PNG?width=50pc)

### General Information

|                            |
| :------------------------- | :---------------- |
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
| **Charging Current Limit**  | 330 mA   |
| **Maximum Drawn Current**   | 500 mA   |
| **Charging Temperature**    | 0 – 60 C |

### Charging State Indication (LEDs)

| Charge cycle state          | LCO | LCG | LCR |
| :-------------------------- | :-- | :-- | :-- |
| **Shutdown state 1**        | OFF | OFF | OFF |
| **Shutdown state 2**        | OFF | OFF | ON  |
| **Preconditioning**         | ON  | OFF | ON  |
| **Constant current**        | ON  | OFF | ON  |
| **Constant voltage**        | ON  | OFF | ON  |
| **Charge complete-standby** | OFF | ON  | ON  |
| **Temperature fault**       | ON  | ON  | ON  |
| **Timer fault**             | ON  | ON  | ON  |
| **Low battery**             | ON  | OFF | OFF |
| **No battery**              | OFF | OFF | ON  |
| **No input**                | OFF | OFF | OFF |

### Switches

| Switch Name | Details                                                                                      |
| :---------- | :------------------------------------------------------------------------------------------- |
| **S1**      | Controls power supply to the micro-controller (the battery charging process is not affected) |
| **S2**      | Tactile switch for activating the micro-controller’s bootloader (needed only for fw upgrade) |
| **SNSR**    | Software-controlled switch for enabling/disabling power supply to sensors on-demand          |

### Communication

- **Wireless technologies**
  - WiFi
  - Bluetooth
  - LoRaWAN
  - NB-IoT/LTE-M
- **IP-based protocols**
  - TCP/UDP over IPv4/IPv6
  - MQTT
  - CoAP

### Sensors Support (Hardware & Software)

|                                |                                                                                    |
| :----------------------------- | :--------------------------------------------------------------------------------- |
| **On-board Sensors**           | 1 x Temperature/Humidity Sensor (based on the SI7021 chip)                         |
| **Number of External Sensors** | Up to 4 (simultaneously)                                                           |
| **External Sensor Interfaces** | Analogue @ 3.3V                                                                    |
|                                | Digital: 1-wire @ 3.3V, I2C @ 3.3V                                                 |
| **Low energy operation**       | Software-controlled                                                                |
| **Sensor models sw support**   | Analogue: Meter’s EC5 (Soil), Pino-Tech’s Soil Watch 10 (Soil)                     |
|                                | 1-wire: DS18B20 (Outdoor Temperature)                                              |
|                                | I2C: SI7021 (Temperature / Humidity), BME680 (Environmental), TSL2561 (Luminosity) |

### Hardware Watchdog

|                       |                                                                              |
| :-------------------- | :--------------------------------------------------------------------------- |
| **Operation**         | Force a power-off/on cycle of the microcontroller after an inactivity period |
| **Control**           | Software-based using a GPIO pin (Enable/Disable)                             |
| **Inactivity Period** | Pre-programmed (on demand), from 2 minutes to 30 hours                       |

### Energy Consumption Profiling

|                     |                                                                                 |
| :------------------ | :------------------------------------------------------------------------------ |
| **Battery Voltage** | Accurate Measurement of battery voltage even at charging state                  |
| **Current**         | Measurement of drawn current at any state (idle, sensor reading, communication) |

### External components required/recommended

- **Microcontroller**
  - Pycom WiPy 3.0 or LoPy4 or GPy or FiPy (depending on communication needs)
- **Battery**
  - 1200 mAh
- **Solar Panel**
  - 6V/1W

### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |
