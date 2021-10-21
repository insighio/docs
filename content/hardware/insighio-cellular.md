---
title: insigh.io integrated cellular board
identifier: "hardware@insighio-cellular"
parent: "hardware"
weight: 210
---

![TAT image](/images/deviceimages/esp32-bg600_v1.png?width=50pc)

### General Information

|                                             |
| :------------------------------------------ | :------------------------------------------------------------------------------------------ |
| **Microcontroller**                         | ESP32                                                                                       |
| **Modem**                                   | GSM / NB-IoT / LTE-M (Nano-SIM)                                                             |
| **GNSS**                                    | GPS, BeiDou, Galileo, GLONASS and QZSS                                                      |
| **Supported Sensors**                       | Load Cell, Temperature, Humidity                                                            |
| **Power Supply**                            | USB, Battery, Solar Panel                                                                   |
| **Misc**                                    | Switches / Headers for firmware flashing and debugging                                      |
|                                             | Support for external switch                                                                 |
| **Software**                                | micropython                                                                                 |
|                                             | Open-source libraries & demo scenarios @ [Github](https://github.com/insighio/insighioNode) |
|                                             | Weigh Scale calibration web-based wizard                                                    |
| **Dimensions (L x W x H)** (+ WiFi antenna) | 78 (83.5) x 57.2 x 16.7 mm                                                                  |
| **Weight**                                  | 25 g                                                                                        |
| **Enclosure**                               | IP65/IP67                                                                                   |

### Example Applications

-   **Beehive monitoring**
    -   Weight, Temperature, humidity
-   **Environmental monitoring**
    -   Air quality, Temperature, humidity
-   **Asset tracking**
    -   Location, Speed, Temperature, humidity

### Sensors Support

|                                |                                                                  |
| :----------------------------- | :--------------------------------------------------------------- |
| **On-board Sensors**           | Temperature/Humidity Sensor (based on the SHT40 chip)            |
| **On-board Sensor Circuit**    | ADC and amplifier for load cell sensors                          |
| **External Sensor Interfaces** | Analogue / Digital: 1-wire @ 3.3V (3-Pin)                        |
|                                | Load Cell (5-Pin)                                                |
|                                | Fixed Terminal Block with push-in connection (no tools required) |

### Communication

-   **Wireless technologies**
    -   WiFi
    -   Bluetooth
    -   GSM / NB-IoT / LTE-M
-   **Transport protocols**
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

|                                       |          |
| :------------------------------------ | :------- |
| **Microcontroller Operating Voltage** | 3.3 V    |
| **Charging Current Limit**            | 440 mA   |
| **Maximum Drawn Current**             | 3 A      |
| **Operational Temperature**           | 0 – 60 C |
| **Charging Temperature**              | 0 – 60 C |

### Charging State Indication (LEDs)

| Charge cycle state    | LCR LED  |
| :-------------------- | :------- |
| **No input**          | OFF      |
| **Temperature fault** | BLINKING |
| **No battery**        | BLINKING |
| **Charging**          | ON       |
| **Charge complete**   | OFF      |

### Switches

| Switch Name | Details                                                                                                     |
| :---------- | :---------------------------------------------------------------------------------------------------------- |
| **S1**      | Controls power supply to the micro-controller (the battery charging process is not affected)                |
| **S2**      | Tactile switch for resetting the micro-controller                                                           |
| **S3**      | Tactile switch for activating the micro-controller’s bootloader (needed only for fw upgrade)                |
| **EXT SW**  | External latching switch to control micro-controller's power (the battery charging process is not affected) |
| **SNSR**    | Electronic software-controlled switch for enabling/disabling power supply to sensors on-demand              |

### Switch combinations & power supply

| External switch (EXT SW) | On-board switch (S1) | Circuit |
| :----------------------- | :------------------- | :------ |
| Open                     | ON                   | ON      |
| Open                     | OFF                  | OFF     |
| Closed                   | ON                   | ON      |
| Closed                   | OFF                  | ON      |

### Energy Consumption Profiling

|                     |                                                                |
| :------------------ | :------------------------------------------------------------- |
| **Battery Voltage** | Accurate Measurement of battery voltage even at charging state |

### External components required/recommended

-   **Battery**
    -   2200-4000 mAh
-   **Solar Panel**
    -   6V/1-2W
-   **Flexible Cellular Antenna**
-   **Flexible GPS Antenna**
-   **SIM card**

### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |

## Custom designs

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
