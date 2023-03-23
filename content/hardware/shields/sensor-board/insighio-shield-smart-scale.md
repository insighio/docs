---
title: Smart Scale
identifier: "hardware@shields@sensor-board@insighio-shield-smart-scale"
parent: "hardware@shields@sensor-board"
weight: 235
---

![shield smart scale](/images/deviceimages/insighio-shield-smart-scale.png?width=20pc)

### Scope
Provide all the required functionality for developing smart scale products that also support user interaction and feedback. The starting point is the weigh scale sensor connection with 5 Pin connector. This sensor, combined with our [Firmware](https://github.com/insighio/insighioNode) offers accurate weight measurement through time, accompanied by our in-house developed configuration and calibration wizard. 

The weigh scale sensor itself is already used in autonomous devices like beehive health monitoring. 

Meanwhile, utilizing the full potential of the offered functionality, more advanced products can be developed which require user interaction. A good examples of such a product is the Smart Scale system for Incentivized Recycling used by citizens. Our shield, apart from measuring the weight of the recycled material, it is able to provide:
 - support for external user recognition devices like RFID and NFC readers
 - the status of the device health through a programmable leds
 - audio feedback for both everyday operations (successful recognition of user & recording of new weight) to audio guidance during smart scale configuration process.

### General Information

|                                  |
| :------------------------------- | :--------------------------------------------------------------- |
| **Host board**                   | [insigh.io main board](../../../board/latest)                    |
| **Supported Sensor Interfaces**  | 1 x ADC for Weigh Scale (5-pin: V+, V-, A+, A-. GND)             |
|                                  | 1 x UART (Vin, GND, RX, TX)                                      |
|                                  | 1 x analog for external button (2-pin)                           |
|                                  | 2 x LED control                                                  |
|                                  | 1 x polyphonic buzzer                                            |
| **Supply Voltage**               | 5V DC                                                            |
| **Maximum Drawn Current**        | 1A                                                               |
| **Sensor Headers**               | Fixed Terminal Block with push-in connection (no tools required) |
|                                  | 2x5-pin + 1x4-pin                                                |
| **Sensor models sw support**     | Analog-to-Digital weigh scale sensor TI ADS1231                  |
|                                  | generic Push button                                              |
|                                  | analog control of led power state                                |
|                                  | rdm6300 (RFID reader), pn532 (NFC reader)                        |
| **Dimensions (L x W x H)**       | 26.7 x 34.3 x 16.7 mm                                            |
| **Weight**                       | 8 g                                                              |


### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |


## Custom designs

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
