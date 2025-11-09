---
title: Base
identifier: "hardware@shields@sensor@insighio-shield-base"
parent: "hardware@shields@sensor"
weight: 10
---

![shield sensor base](/images/deviceimages/insighio-shield-base.png?width=20pc)

### Scope
Provide support for multiple analogue & a single digital (I²C) sensors. It is applicable to entry level applications like smart agriculture and basic temperature/humidity monitoring.

### General Information

|                                  |
| :------------------------------- | :--------------------------------------------------------------- |
| **Host board**                   | [insigh.io main board](../../../main)                            |
| **Version**                      | 1.0.0                                                            |
| **Supported Sensor Interfaces**  | 3 x Analogue (3-pin: VIN, DATA, GND)                             |
|                                  | 1 x I²C (VIN, GND, SCL, SDA)                                     |
| **Supply Voltage**               | 3.3V DC electronically controlled through the firmware           |
| **Maximum Drawn Current**        | 250mA                                                            |
| **Sensor Headers**               | 1x13 Fixed Terminal Block with push-in connection                |
|                                  | 1x13-pin                                                         |
| **Sensor models sw support**     | Any 3.3V supplied analogue/I²C sensor                            |        |
| **Dimensions (L x W x H)**       | 26.7 x 34.3 x 16.7 mm                                            |
| **Weight**                       | 8 g                                                              |


{{% notice info %}}
This is an entry level low-cost board with **limited capabilities**. It mostly serves the purpose of testing and familiarizing with the product. For example only 3.3V sensors are suppored and for analogue signals readings we use the lower precision ADC of ESP32. We advise to look at the [Enviro](../insighio-shield-enviro/) shield for critical projects.
{{% /notice %}}

### Indicative list of tested sensors
* Soil Moisture: EC5 (METER), Soil Watch 10 (PINO-TECH)
* Temperature/Humidity: SHT20

### Advanced Topics
#### Pins
For completeness we provide the main board pins used to implement this sensor board:
- Power Pins (Output Only)
  - 3.3V : Constant 3.3V Output from LDO used to power the Sensors
  - S_GND : Electronically-controlled Ground Pin (ground switch through IO12 in the firmware)
- Other Sensor/Control Pins (Input/Output)
  - SDA (IO39) & SCL (IO38)    : Control & Data Pins for getting measurements from I²C sensors
  - IO5, IO7 & IO9 : ESP32 ADC compliant pins for getting analogue readings from Analogue Sensor Ports 1, 2 and 3 respectively
