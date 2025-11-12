---
title: Satellite (ASTROCAST)
identifier: "hardware@shields@connectivity@insighio-shield-astrocast"
parent: "hardware@shields@connectivity"
weight: 20
---

{{< customtable "table autowidth" >}}
| |
| :-: | :-: |
| ![Satellite](/images/deviceimages/insighio-shield-astrocast.png?width=20pc) | ![Satellite](/images/deviceimages/insighio-shield-astrocast-flipped.png?width=20pc) |
{{< /customtable >}}

### Scope

Enrich radio connectivity capabilities with **Astrocast's Satellite IoT** technology support and embedded GPS

### General Information

|                            |
| :------------------------- | :----------------------------------------------------------------- |
| **Host board**             | [insigh.io main board](../../../main)                              |
| **Add-on Capabilities**    | [Astronode S Module for Satellite IoT Connectiviy through Astrocast's Network](https://www.astrocast.com/products/astronode-s/) |
|                            | GNSS based on L76L-M33 (QUECTEL) Module flashed with I²C firmware  |
| **External components**    | Ribbon Flex Cable (Part number: 92317-1012)                        |
|                            | Flexible GNSS Antenna (for GPS option)                             |
| **Dimensions (L x W x H)** | 78.31 x 63.15 x 7                                                  |
| **Weight**                 | 12g                                                                |


{{% notice info %}}
**[Astronode Compact ceramic patch antenna](https://www.astrocast.com/products/astronode-patch-antenna/)** optimized for operation on the Astrocast network is embedded on the top side of the board
{{% /notice %}}

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
  - **IO38** & **IO39** : **I²C** Control (SCL) & Data (SDA) Line (Already Pulled-up) for controlling GPS
  - **IO15** & **IO16** : **Serial (UART)** Pins for communicating with the Astrocast Modem
  - **IO35** & **IO36** : GPS control & reset pins
  - **IO40** & **IO18** : Astrocast Modem Event & Reset Pins

#### Pins Description

- Power Pins (Output Only)
  - **3.3V**: Constant 3.3V Output from LDO used to power the Radio/GPS
  - **GND**: Common Ground
- Other Sensor/Control Pins (Input/Output)
  - **IO38** & **IO39** : **I²C** Control (SCL) & Data (SDA) Line (Already Pulled-up) for controlling GPS
  - **IO15** & **IO16** : **Serial (UART)** Pins for communicating with the Astrocast Modem
  - **IO35** & **IO36** : GPS control & reset pins
  - **IO40** & **IO18** : Astrocast Modem Event & Reset Pins

### Firmware Support (Micropython)
* Use the **[insighioNode](https://github.com/insighio/insighioNode)** repository for a plug-and-play solution.
* Use the **[astronode-micropython](https://github.com/insighio/astronode-micropython)** library for custom scenarios.

{{% notice info %}}
The **ASTROCAST Satellite IoT** shield can be directly used with any other **ESP32** module or dev board and our **Micropython** firmware.
{{% /notice %}}

### Changelog

| Version  | Release Date | Comments
| :---- | :-----------| :--------|
| 1.0.0 | 15/10/2022  | First stable version with Molex Connector|