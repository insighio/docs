---
title: Satellite (Astrocast)
identifier: "hardware@shields@radio@insighio-shield-astrocast"
parent: "hardware@shields@radio"
weight: 240
---

![shield satellite astrocast gps](/images/deviceimages/insighio-shield-astrocast.png?width=30pc)


### Scope
Enrich radio connectivity capabilities with __Astrocast's Satellite__ technology support and embedded GPS

### General Information

|                                  |
| :------------------------------- | :---------------------------------------------------------------- |
| **Host board**                   | [insigh.io main board](../../../board/latest)                     |
| **Add-on Capabilities**          | [Astronode S Module for Satellite IoT Connectiviy through Astrocast's Network](https://www.astrocast.com/products/astronode-s/)|
|                                  | GNSS based on L76L-M33 (QUECTEL) Module flashed with I²C firmware |
| **Dimensions (L x W x H)**       | 78.31 x 63.15 x 7 mm                                              |
| **Weight**                       | 7 g                                                               |

### External components required/recommended
- **Flexible GNSS Antenna** for GPS option
- **[Astronode Compact ceramic patch antenna](https://www.astrocast.com/products/astronode-patch-antenna/)** optimized for operation on the Astrocast network is embedded on the top side of the board

### Pins
#### Pins Mapping
**Note:** Orientation is reversed based in the board picture

| R3-1  | R3-2 |
| :---- | :--- |
| GND   | 3.3V |
| IO40  | IO18 |
| IO35  | IO36 |
| IO39 (SDA)   | IO15 |
| IO38 (SCL)   | IO16 |

#### Pins Description
- Power Pins (Output Only)
  - __3.3V__: Constant 3.3V Output from LDO used to power the Radio/GPS
  - __GND__: Common Ground
- Other Sensor/Control Pins (Input/Output)
  - __IO38__ & __IO39__ : __I²C__ Control (SCL) & Data (SDA) Line (Already Pulled-up) for controlling GPS
  - __IO15__ & __IO16__ : __Serial (UART)__ Pins for communicating with the Astrocast Modem
  - __IO35__ & __IO36__ : GPS control & reset pins
  - __IO40__ & __IO18__ : Astrocast Modem Event & Reset Pins

### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |


### Notes
Use **[insighioNode](https://github.com/insighio/insighioNode)** repository or **[astronode-micropython](https://github.com/insighio/astronode-micropython)** independent library

## Custom designs

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
