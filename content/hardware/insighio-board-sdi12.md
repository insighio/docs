---
title: Pycom SDI-12 Host Board
identifier: "hardware@insighio-board-sdi12"
parent: "hardware"
weight: 270
---

![TAT image](/images/deviceimages/board-sdi12.PNG?width=40pc)

### General Information

|                            |
| :------------------------- | :------------------------------------------------------------------------------------------ |
| **Host board**             | Pycom development board ([link](https://pycom.io/shop/#dev))                                |
| **Supported Sensors**      | SDI-12 sensors, Temperature, Humidity                                                       |
| **Power Supply**           | USB, Battery, Solar Panel                                                                   |
| **Misc**                   | USB for firmware flashing and debugging                                                     |
|                            | Power switch                                                                                |
| **Software**               | micropython                                                                                 |
|                            | Open-source libraries & demo scenarios @ [Github](https://github.com/insighio/insighioNode) |
| **Dimensions (L x W x H)** | 78 x 57.2 x 16.7 mm                                                                         |
| **Weight**                 | 25 g                                                                                        |
| **Enclosure**              | IP65/IP67                                                                                   |

### Example Applications

-   **Precision Agriculture**
    -   Soil moisture, Electrical Conductivity, Volumetric Water Content, Temperature
-   **Environmental monitoring**
    -   Water flow, water quality, Temperature, humidity

### Sensors Support (Hardware & Software)

|                                |                                                            |
| :----------------------------- | :--------------------------------------------------------- |
| **On-board Sensors**           | 1 x Temperature/Humidity Sensor (based on the SI7021 chip) |
| **Number of External Sensors** | Up to 2 (simultaneously)                                   |
| **External Sensor Interfaces** | Digital: SDI-12 @ 12V                                      |
| **Low energy operation**       | Software-controlled                                        |
| **Sensor models sw support**   | I2C: SI7021 (Board Temperature / Humidity )                |
|                                | SDI-12: Meter’s Teros-12 (Soil), Acclima’s TDR-315H (Soil) |

### Communication

-   **Wireless technologies**
    -   WiFi
    -   Bluetooth
    -   LoRaWAN
    -   NB-IoT/LTE-M
-   **IP-based protocols**
    -   TCP/UDP over IPv4/IPv6
    -   MQTT
    -   CoAP

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

-   **Microcontroller**
    -   Pycom WiPy 3.0 or LoPy4 or GPy or FiPy (depending on communication needs)
-   **Battery**
    -   1200 mAh
-   **Solar Panel**
    -   6V/1W

### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |

## Custom designs

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
