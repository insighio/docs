---
title: Basic
identifier: "hardware@shields@sensor-board@insighio-shield-basic"
parent: "hardware@shields@sensor-board"
weight: 215
---

![shield adc i2c](/images/deviceimages/insighio-shield-base-adc-i2c.png?width=30pc)

### Scope
Provide support to multiple analogue & a single digital (I²C) sensors. It is applicable to various applications like smart agriculture and outdoor temperature/humidity monitoring

### General Information

|                                  |
| :------------------------------- | :--------------------------------------------------------------- |
| **Host board**                   | [insigh.io main board](../../../board/latest)      |
| **Supported Sensor Interfaces**  | 3 x Analogue (3-pin: VIN, DATA, GND)                             |
|                                  | 1 x I²C (PWR, GND, SCL, SDA)                                     |
| **Supply Voltage**               | 3.3V DC                                                          |
| **Maximum Drawn Current**        | 1A                                                               |
| **Sensor Headers**               | Fixed Terminal Block with push-in connection (no tools required) |
|                                  | 1x13-pin                                                         |
| **Sensor models sw support**     | Any 3.3V supplied analogues/I²C sensor                           |
|                                  | Fully tested against: METER's EC5 & PINO-TECH's Soil Watch 10    |
|                                  | (soil moisture), SHT20 (Temp/Hum), TSL2561 (Luminosity)          |
| **Dimensions (L x W x H)**       | 26.7 x 34.3 x 16.7 mm                                            |
| **Weight**                       | 8 g                                                              |


### Pins
For completeness we provide the main board pins used to implement this sensor board:
- Power Pins (Output Only)
  - 3.3V : Constant 3.3V Output from LDO used to power the Sensors
  - S_GND : Electronically-controlled Ground Pin (ground switch through IO12)
- Other Sensor/Control Pins (Input/Output)
  - IO38 & IO39    : I²C Control (SCL) & Data (SDA) Line (Already Pulled-up) for controlling GPS
  - IO5, IO6 & IO7 : ADC compliant pins for getting analogue readings from Analogue Sensor Port 1, 2 and 3 respectively

### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |


## Custom designs

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
