---
title: LoRa
identifier: "hardware@shields@connectivity@insighio-shield-lora"
parent: "hardware@shields@connectivity"
weight: 10
---

![LoRa](/images/deviceimages/insighio-shield-lora.png?width=15pc)


### Scope
Enrich radio connectivity capabilities with __LoRa/LoRaWAN__ technology and dedicated GPS

### General Information

|                                  |
| :------------------------------- | :---------------------------------------------------------------- |
| **Host board**                   | [insigh.io main board](../../../main)                             |
| **Version**                      | 1.0.0                                                             |
| **Add-on Capabilities**          | LoRa Radio Modem based on RAK3172 (RAK WIRELESS) Module           |
|                                  | GNSS based on L76L-M33 (QUECTEL) Module flashed with I²C firmware |
| **External components**          | Ribbon Flex Cable (Part number: 92317-1012)                       |
|                                  | ISM 868-915MHz Antenna                                            | 
|                                  | Flexible GNSS Antenna (for GPS option)                            |
| **Software Support**             | Internal Payload Encoder. Use with any LoRaWAN Network Server     |
| **Dimensions (L x W x H)**       | 30.5 x 49 x 10 mm                                                 |
| **Weight**                       | 7 g                                                               |

### Pinout
#### Connectivity Expansion Port

| J2   |
| :-------------------- | :------- |
| 1         | GND       |
| 2         | 3.3V      |
| 3         | IO40      |
| 4         | IO18      |
| 5         | IO35      |
| 6         | IO36      |
| 7         | SDA       |
| 8         | UART1_TX  |
| 9         | SCL       |
| 10        | UART1_RX  |

#### Pins Description
- Power Pins (Output Only)
  - __GND__: Common Ground
  - __3.3V__: Constant 3.3V Output from LDO used to power the Radio/GPS
- Other Control Pins (Input/Output)
  - __IO38__ & __IO39__ : __I²C__ Control (SCL) & Data (SDA) Line (Already Pulled-up) for controlling GPS
  - __IO15__ & __IO16__ : __Serial (UART)__ Pins for communicating with the LoRa Modem
  - __IO35__ & __IO36__ : Radio/GPS control & reset pins
  - __IO18__ : LoRa module reset pin
  - __IO40__ : Free pin (FFC)

### Changelog

| Version  | Release Date | Comments
| :---- | :-----------| :--------|
| 1.0.1 | 16/12/2024  | Mechanical changes (changed hole position).|
| 1.0.0 | 04/10/2023  | First stable version with RAK3172 and continuous power.|
