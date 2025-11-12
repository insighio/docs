---
title: LoRa Low-Frequency
identifier: "hardware@shields@inactive@insighio-shield-lora-lf"
parent: "hardware@shields@inactive"
weight: 220
---

![shield lora gps](/images/deviceimages/insighio-shield-lora-lf.png?width=20pc)


### Scope
Enrich radio connectivity capabilities with __LoRa__ low-frequency (VHF-band) operating at __169 MHz__

### General Information

|                                  |
| :------------------------------- | :---------------------------------------------------------------- |
| **Host board**                   | [insigh.io main board](../../main/)                               |
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


### Firmware Support
* Currently, basic functionality of the shield can be enabled with the open-source Micropython library __u-lora__ available in [Github](https://github.com/martynwheeler/u-lora)