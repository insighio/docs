---
title: LoRa Low-Frequency (169MHz)
identifier: "hardware@shields@radio@insighio-shield-lora-lf"
parent: "hardware@shields@radio"
weight: 230
---

![shield lora gps](/images/deviceimages/insighio-shield-lora-lf.png?width=30pc)


### Scope
Enrich radio connectivity capabilities with __LoRa__ low-frequency (VHF-band) operating at __169 MHz__

### General Information

|                                  |
| :------------------------------- | :---------------------------------------------------------------- |
| **Host board**                   | [insigh.io main board](../../../board/latest)                     |
| **Add-on Capabilities**          | Radio Modem based on __RFM98W-169S2 (HopeRF)__ module                 |
|                                  | Chipset: Semtech's __SX1276__ 137 MHz to 1020 MHz Low Power Long Range Transceiver |
| **Dimensions (L x W x H)**       | 30.5 x 49 x 16.7 mm                                               |
| **Weight**                       | 7 g                                                               |

### External components required/recommended
-   **External VHF (169 MHz) Antenna** with **U.FL to SMA** cable (example part number: 169M-ANT720)

### Connection
|
| :------------------------------- | :---------------------------------------------------------------- |
| **Connector**                   | Special 10-pin Connector (Part number: __90325-0010__ [Molex] )                |
| **Cable**                       | Special Flexible 10-pin Ribbon Cable (Part Number: __92317-1015__ [Molex] )                |


### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |


### Firmware Support
* Currently, basic functionality of the shield can be enabled with the open-source Micropython library __u-lora__ available in [Github](https://github.com/martynwheeler/u-lora)
* Full ["insighio-ready"](https://github.com/insighio/insighioNode) firmware support expected in Q2-23

## Custom designs

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
