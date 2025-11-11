---
title: Scale
identifier: "hardware@shields@sensor@insighio-shield-scale"
parent: "hardware@shields@sensor"
weight: 40
---

![shield sensor scale](/images/deviceimages/insighio-shield-scale.png?width=25pc)

### Scope
Provide support for weight measurements using load cell sensors. In addition, measurements are accompanied with audio/visual user notifications as well as user interaction through a serial port able to communicate with external RFID cards.

Our baseline firmware supports a baseline periodic weight measurement of a:
- Beehive, for monitoring production of honey.
- Bin, for tracking waste generation.

Then, by utilizing the full potential of the offered functionality, more advanced usage scenarios can be developed which require user interaction. A good example is the Smart Scale system for Incentivized Recycling used by citizens. The shield, apart from measuring the weight of the recycled material, is able to provide:
 - Support for external user recognition devices like RFID and NFC readers
 - The status of the device health through programmable leds
 - Audio feedback for both everyday operations, such as successful recognition of user & recording of new waste throwing event


{{% notice info %}}
This shield is still under development. **[Registrer your interest](mailto:info@insigh.io)** to discuss further options.
{{% /notice %}}

### General Information
|                                  |
| :------------------------------- | :------------------------------------------------------------------------------------------------ |
| **Host board**                   | [insigh.io main board](../../../main)                                                             |
| **Version**                      | v1.0.0                                                                                            |
| **Supported Sensor Interfaces**  | 1 x Load-Cell (5-pin: V+, V-, A+, A-. GND)                                                        |
| **Supported Peripherals**        | 1 x UART (Vin, GND, RX, TX) for external recognition devices like RFID readers                    |
|                                  | 1 x Press Button Input (e.g. for implementing TARE)                                               |
|                                  | 1 x Multi-Color LED                                                                               |
|                                  | 1 x polyphonic buzzer                                                                             |
| **Supply Voltage**               | 5V DC                                                                                             |
| **Sensor Headers**               | 1x5-pin (Load Cell) & 1x5-pin (Button,Led) & 1x4-pin (UART for RFID/NFC)                          |
| **Software Support**             | Under development. **[Get in contact with us](mailto:info@insigh.io)** for further information    |

### Indicative list of tested sensors
* Any Load Cell
* rdm6300 (RFID reader)
* pn532 (NFC reader)  
