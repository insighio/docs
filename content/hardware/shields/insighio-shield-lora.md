---
title: LoRa/GPS Shield
identifier: "hardware@shields@insighio-shield-lora"
parent: "hardware@shields"
weight: 240
---

![shield lora gps](/images/deviceimages/insighio-shield-lora.png?width=30pc)


### Scope
Enrich radio connectivity capabilities with __LoRaWAN__ technology support and embedded GPS

### General Information

|                                  |
| :------------------------------- | :---------------------------------------------------------------- |
| **Host board**                   | [insigh.io main board]({{< relref "../insighio-main.md" >}})       |
| **Add-on Capabilities**          | LoRa Radio Modem based on RAK4270 (RAK WIRELESS) Module           |
|                                  | GNSS based on L76L-M33 (QUECTEL) Module flashed with I²C firmware |
| **Dimensions (L x W x H)**       | 30.5 x 49 x 16.7 mm                                               |
| **Weight**                       | 7 g                                                               |

### External components required/recommended
-   **Flexible ISM 868-915MHz Antenna**

### Pins
#### Pins Mapping
**Note:** Orientation as in the board picture

| R3-1  | R3-2 |
| :---- | :--- |
| GND   | 3.3V |
| IO40  | IO18 |
| IO35  | IO36 |
| SDA   | IO15 |
| SCL   | IO16 |

#### Pins Description
- Power Pins (Output Only)
  - __3.3V__: Constant 3.3V Output from LDO used to power the Radio/GPS
  - __GND__: Common Ground
- Other Sensor/Control Pins (Input/Output)
  - __IO38__ & __IO39__ : __I²C__ Control (SCL) & Data (SDA) Line (Already Pulled-up) for controlling GPS
  - __IO15__ & __IO16__ : __Serial (UART)__ Pins for communicating with the LoRa Modem
  - __IO35__ & __IO36__ : Radio/GPS control & reset pins
  - __IO40__ & __IO18__ : Free pins (FFC)

### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |


### Notes
Full firmware support expected in Q3-22

## Custom designs

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
