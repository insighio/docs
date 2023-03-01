---
title: Hardware
pre: "<b>2. </b>"
identifier: "hardware"
weight: 200
---

## Description

insigh.io board is a generic and affordable hardware device, designed for accelerating IoT adoption:

- Its integrated functionality allows for rapid deployment, enhanced telemetry and cost-effective maintenance.
- It is equally capable of being used as a development board or for implementing small PoCs and then scale to deployments counting hundreds of nodes.
- It is super flexible as it can be used both by experts and the general public:
  - When used as a development board by experts, an extendable open-source Micropython firmware is available for quick prototyping.
  - When used as an end board by non-experts, it can be deployed with minimum prior know-how and configured with the help of an intuitive application.
- It is perfectly suited for outdoor or indoor operation, as it can be easily enclosed to an IP-rated box and supplied by various energy sources.

It follows a modular architecture:

- A **main board** embedding the core functionalities out of the box:
  - Low-power processing
  - Power supply with automatic management
  - **WiFi & Cellular** connectivity with data provisioning
  - **GPS** support for outdoor localization
  - On-board diagnostic sensors and functionalities
  - Ports for connecting **LiPo battery, solar panel, and USB power/data cable**.
  - Debugging port through standard Serial or USB cable
- A set of **"add-on" boards** attached to the main board for:
  - Supporting multiple popular analogue and digital sensor interfaces: **analogue voltage/current readings, digital (e.g. pulse) readings, I²C, SDI-12, 4-20mA**
  - Hosting various sensors with built-in firmware support: _soil moisture sensors, temperature/humidity probes, load cells, CO2 sensors, accelerometers/magnetometers_.
  - Implementing different IoT applications: _smart agriculture, environmental monitoring, precision apiculture, rewarding recycling, air-quality inspection, road hazard detection_
  - Expanding connectivity options: **LoRaWAN** and **Satellite IoT**
  - Adding specialized features: hardware watchdog, hardware security, energy consumption profiling
  - Adding your own functionalities and applications: everything

## Specifications

### Main Board

This is the "heart" of the hardware offering. Based on the main board, we or you can build a complete hardware solution that perfectly fits any case.
It exposes 30 input/output pins -power/analogue/digital for supplying and controlling external devices- allowing for implementing different breadboard configurations or attaching our ready-made add-on boards.
For more details about the technical specifications of the main board refer to page [Main Board with exposed pins](./board/latest).

![TAT image](/images/deviceimages/insighio-main-latest.png?width=40pc)

### Shield Boards

This is a collection of standard "ready-made" IoT application boards which can be used out-of-the-box and communicate with popular sensors and widely applicable interfaces. Sensors can be connected using push-in headers (no tools required). The current list includes sensor and radio boards:

#### Sensor Boards

- [Generic Analogue & Digital Sensor Board with support for up to 3 x 3-pin (power,data,ground) analogue sensors & 1 x I²C sensor]({{< relref "./shields/sensor-board/insighio-shield-base-adc-i2c.md" >}})
- [Advanced Industrial Sensor Board with support for up to 2 x SDI-12, 2 x 4-20mA & 1 generic 2-pin pulse counter]({{< relref "./shields/sensor-board/insighio-shield-advind.md" >}})
- [Air Quality and Vibrations Sensor Board]({{< relref "./shields/sensor-board/insighio-air-quality-and-vibrations.md" >}})

#### Radio Boards

- [Communications Expansion Board for enabling **LoRaWAN** connectivity and **GPS** tracking]({{< relref "./shields/radio/insighio-shield-lora.md" >}})
- [Communications Expansion Board for enabling **Satellite** connectivity using **ASTROCAST's** network and **GPS** tracking]({{< relref "./shields/radio/insighio-shield-astrocast.md" >}})
- [Communications Expansion Board for enabling **LoRa** connectivity at low VHF frequencies (**169 MHz**)]({{< relref "./shields/radio/insighio-shield-lora-lf.md" >}})

### Custom Designs

There is a series of older hardware designs used by our Clients that may worth check as well (not recommended for new users):

- [Integrated Cellular Board with support to Load Cell and Analog/Digital sensors]({{< relref "./custom/insighio-cellular-weigh-scale.md" >}})
- [Generic host board with support to I²C, Analog and Digital sensors (requires a Pycom module)]({{< relref "./custom/insighio-board-generic.md" >}})
- [SDI-12 compatible host board with RS-485 (requires a Pycom module)]({{< relref "./custom/insighio-board-sdi12.md" >}})

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
