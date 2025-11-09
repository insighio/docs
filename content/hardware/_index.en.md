---
title: Hardware
pre: "<b>2. </b>"
identifier: "hardware"
weight: 200
---

{{< customtable "table autowidth" >}}
| | |
| -------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| ![insigh.io IoT node](/images/deviceimages/insighio-node-2.png?width=35pc) | ![insigh.io IoT node](/images/deviceimages/insighio-node.png?width=35pc) |
{{< /customtable >}}

## Overview

insigh.io **IoT node** is a modular hardware device, enabling customized IoT data collection quickly and affordably:

- Its **integrated functionality** allows for rapid deployment, enhanced telemetry and cost-effective maintenance.
- It is equally capable of being used as a development board for implementing **small PoCs or scale to enterprise IoT deployments** counting hundreds of nodes.
- It is perfectly suited for **unattended outdoor or indoor operation** as it comes with an IP-rated enclosure (option) and supplied by various energy sources, such as batterries and solar panels.
- It can be **used by non-experts**, such as system integrators, installation contractors, and internal departments of non-IT companies.
- It can be deployed and configured with minimum prior know-how with the help of an **intuitive web configuration application**.

{{% notice note %}}
When used as a **development board** by tech-savyys (developers/makers), hardware pinout information along with an extendable open-source Micropython firmware are available for infinite customization.
{{% /notice %}}

insigh.io IoT node is designed with a **modular architecture**:

- A **main board** embedding the core IoT hardware elements and functionalities out of the box:
  - Low-power programmable **micro-controller**
  - Ports for connecting **battery, solar panel, and USB power/data cable**, with automated management
  - **WiFi & Cellular** connectivity
  - **GPS** for outdoor localization
  - On-board **diagnostic sensors** (temperature, humidity) and **health-checks** (battery status, charging status. etc.)
  - Debugging port through standard Serial or USB cable
  - Memory for **local sensor data storage**
  - Various **controls** and **indicators** like on/off switch & status LEDs
- Various **expansion boards simply called "shields"** that can be attached to the corresponding main board expansion ports for:
  - Supporting multiple analogue and digital sensor interfaces, such as  **analogue voltage/current readings, digital (e.g. pulse) readings, I²C, SPI, SDI-12, Modbus-RTU, 4-20mA, etc.** (sensor shield)
  - Expanding connectivity options beyond WiFi/Cellular, such as **LoRaWAN** and **Satellite IoT** (connectivity shield)
  - Adding your own functionalities and applications: ad-hoc customization
- A **bundle of peripherals** (optional) for unattended deployment and operation in the field:
  - IP-rated enclosure made of ABS/PC material with PCB mounting
  - Waterproof connectors for external sensors and cables (glands or specialized connectors)
  - External mechanical switch for enabling/disabling the node without opening the lid
  - Internal antennnas
  - Vent plug
  - Rechargeable battery & Solar Panel
  - Cellular Connectivity SIM & Data Plan

## List of Boards

### Main Board

This is the "heart" of the hardware offering, as it is a "standalone" autonomous and powered IoT device. 

Based on the main board, we build a complete hardware solution that perfectly fits any case. To do so, the main board exposes:
* A standard Female Headers Pin Connector for attaching one of our sensor shield, depending on the target application
* A custom Ribbon Cable Connector for (optionally) attaching one of our additional connectivity shields, depending on the network availability

Move to page [Main Board](./main/) to view the complete technical specifications of this board. 

![TAT image](/images/deviceimages/insighio-main.png?width=30pc)

### Shields

This is a collection of standard "ready-made" expansion boards which can be used out-of-the-box and communicate with standard sensors and networks. For each shield, visit the corresponding dedicated page.

#### Sensor Shields

| Shield Name | SKU | Sensor Interfaces | Typical Sector | Example Sensors| 
| :-------------------- | :------- | :------- | :--------|  :--------|
| [Base]({{< relref "./shields/sensor/insighio-shield-base.md" >}}) |  **INS-S-S-BAS**  | 3 x Analogue & 1 x I²C bus (3.3V) | Agriculture | Soil Conductivity |
| [Advanced]({{< relref "./shields/sensor/insighio-shield-advanced.md" >}}) |  **INS-S-S-ADV**  | 2 x SDI-12 & 2 x 4-20mA & 1 x Pulse Counter (12V)  | Agriculture | Advanced Soil & Water Status |
| [Enviro]({{< relref "./shields/sensor/insighio-shield-enviro.md" >}}) |  **INS-S-S-ENV**  | 2 x SDI-12 & 1 x Modbus-RTU & 4 x Analogue/4-20mA & 2 x Pulse Counter (5V/9V/12V)  | Environmental | Extended Weather Conditions |
| [Scale]({{< relref "./shields/sensor/insighio-shield-scale.md" >}}) |  **INS-S-S-SCA**  | 1 x High Precision ADS (5V) | Waste Management | Weight (Load Cells) |
| [Machine]({{< relref "./shields/sensor/insighio-shield-machine.md" >}}) |  **INS-S-S-MAC**  | 1 x Modbus RTU & 3 x High Precision ADS (3.3V) | Industrial Machinery | PLC & Energy Meters |

#### Connectivity Shields

| Shield Name | SKU | Network | Example Applications | 
| :-------------------- | :------- | :------- | :--------|  :--------|
| [LoRa]({{< relref "./shields/connectivity/insighio-shield-lora.md" >}}) |  **INS-S-C-LOR**  | LoRaWAN | Smart buildings resources usage |
| [SatIoT]({{< relref "./shields/connectivity/insighio-shield-astrocast.md" >}}) |  **INS-S-C-AST**  | Satellite IoT based on ASTROCAST network | Environmental Monitoring in remote areas (oceans, mountains) |



{{% notice info %}}
There is also a series of former/inactive hardware boards that are not commercially available. Page [Inactive]({{< relref "./inactive/_index.en.md" >}}) lists these boards. Notice that interest for these boards is hanlded on an ad-hoc basis.
{{% /notice %}}
