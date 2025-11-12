---
title: Machine
identifier: "hardware@shields@sensor@insighio-shield-machine"
parent: "hardware@shields@sensor"
weight: 50
---

![shield sensor scale](/images/deviceimages/insighio-shield-machine.png?width=25pc)


### Scope
Provide support for remote machine control, using standard interfaces, i.e. Modbus RTU & 4-20mA. Typical applications include the control of machines "brain", namely PLCs, and energy consumpetion, using non-obstructive current sensors.

{{% notice info %}}
This shield is still under development. **[Registrer your interest](mailto:info@insigh.io)** to discuss further options.
{{% /notice %}}


## General Information
|                                  |
| :------------------------------- | :------------------------------------------------------------------------------------------------ |
| **Host board**                   | [insigh.io main board](../../../main)                                                             |
| **Version**                      | v1.0.1                                                                                            |
| **Supported Sensor Interfaces**  | 1 x Modbus-RTU (A, B, GND) & 4 x 2-wire 4-20mA                                                    |
| **Sensor Headers**               | 1x3-pin (Modbus-RTU) & 1x8-pin (4-20mA)                                                           |
| **Supply Voltage**               | None: External Voltage should be used for Modbus. No supply is needed for 4-20mA sensors          |
| **Dimensions (L x W)**           | 50.9 x 49.5 x 16.7 mm                                                                             |
| **Weight**                       | 10 g                                                                                              |
| **Software Support**             | Under development. **[Get in contact with us](mailto:info@insigh.io)** for further information    |


### Indicative list of tested devices
* PLCs with Modbus RTU interface (slave), such as IDEC
* Split Core Transformers with 4-20mA interface, such YHDC

### Sensor Ports

#### Modbus-RTU
|                           |                                                                                     |
| :------------------------ | :---------------------------------------------------------------------------------- |
| **Number of Physical Sensors**  | 1 x Physical Port with 3 pins (A,B,GND). External Power is needed  |
| **Number of Supported Sensors (SW/HW)**  | Multiple slaves with external combiner   |


#### 4-20mA for Split Core CTs
|                           |                                                                                     |
| :------------------------ | :---------------------------------------------------------------------------------- |
| **Number of Physical Sensors**  | 4 x Physical Port for 2-wire 4-20mA sensors. |
| **Analogue Readings**  | High Precision 4-channel 24-bit ADC Processing based on ADS131M03 IC. Automated transformation to RMS current voltages.  |

### Marking

|          |             |
| :------- | :---------- |
| **CE**   | _ongoing, expected to be completed in Q1-2026_ |


### Changelog

| Version  | Release Date | Comments
| :---- | :-----------| :--------|
| 1.0.1 | 12/02/2025  | - Added placeholder pads (NM component) for RS485 termination resistor |
| 1.0.0 | 28/11/2024  | - First stable version |
