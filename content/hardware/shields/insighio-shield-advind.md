---
title: Advanced Industrial Sensor Shield
identifier: "hardware@shields@insighio-shield-advind"
parent: "hardware@shields"
weight: 230
---

![shield sdi12 4-20mA pulse counter](/images/deviceimages/insighio-shield-advind.png?width=30pc)

### Scope
Provide support for SDI-12, 4-20mA and pulse counter sensors with flexible configurations. It is applicable to Agriculture & Environmental Monitoring applications.

### General Information

|                                  |
| :------------------------------- | :---------------------------------------------------------------- |
| **Host board**                   | [insigh.io main board]({{< relref "../insighio-main.md" >}})       |
| **Supported Digital Interfaces** | 2 x SDI-12 & 2 x 4-20mA & 1 x Pulse Counter                       |
| **Sensor Headers**               | Fixed Terminal Block with push-in connection (no tools required)  |
|                                  | 1x8-pin (SDI-12 & Pulse Counter) & 1x6-pin (4-20mA)               |
| **Dimensions (L x W x H)**       | 41.3 x 47 x 16.7 mm                                               |
| **Weight**                       | 16 g                                                              |

### Example Applications

-   **Precision Agriculture**
    -   Soil moisture, Electrical Conductivity, Volumetric Water Content, Temperature
-   **Environmental monitoring**
    -   Water flow, water quality, Temperature, Humidity


### Sensors Support (Hardware & Software)

#### SDI-12 Interface

|                                 |                                                                                  |
| :-----------------------------  | :--------------------------------------------------------------------------------|
| **Number of Supported Sensors** | Up to 2 (simultaneously), 3 pins (POWER,DATA,GND) each                           |
|                                 | Up to 9 if external combiner is used                                             |
| **Supply Voltage**              | 12V DC (external power supply may be used as well)                               |
| **Maximum Drawn  Current**      | 1A                                                                               |
| **Sensor models sw support**    | General SDI-12 Commands Implementation                                           |
|                                 | Fully tested against the following models: TEROS-12 (METER) & TDR-315H (ACCLIMA) |
| **Advanced Features**           | Resistors R7,R10,R3 for controlling "power" mode                                  |
|                                 | Jumpers J5 & J6 for controlling "measurement" mode                               |

#### 4-20mA Interface

|                                 |                                                                                  |
| :-----------------------------  | :--------------------------------------------------------------------------------|
| **Number of Supported Sensors** | Up to 2 (simultaneously) / 2-wire or 4-wire                                      |
| **Supply Voltage**              | 12V DC (external power supply may be used as well)                               |
| **Maximum Drawn  Current**      | 1A                                                                               |
| **Sensor models sw support**    | Sensor-agnostic, using a 2-channel analogue current sensing circuit              |
|                                 | Fully tested with HAITRONIC 4-20mA 4-wire Digital Signal Generator Module Board) |
| **Advanced Features**           | Jumpers J3 & J4 for controlling "measurement" mode                               |

#### Generic Digital Interface

|                                 |                                                       |
| :-----------------------------  | :-----------------------------------------------------|
| **Number of Supported Sensors** | 1                                                     |
| **Supply Voltage**              | No, the sensor should be externally powered)          |
| **Typical Usage**               | Pulse Counter (feature not supported yet in firmware) |
 **Advanced Features**           | Jumpers J7 for controlling "measurement" mode         |


#### Advanced Features
##### "Power" mode
There are 2 "power" modes for both SDI-12 and 4-20mA controlled via the PCB hardware & firmware:
- __"Heating" mode (default)__: It applies continuous 12V DC. This is required by some sensor for condensation avoidance (e.g. Oxygen Sensor SO-411 from Apogee). It is enabled through mounting R7 (1K) and not mounting R10 (0 Ohm) & R3 (1M).
- __"Low-power" mode__: This is a mode optimized for energy consumption. To select this mode remove R7 (1K) and mount R10 (0 Ohm) & R3 (1M). In this mode, the sensors are powered only during the micro-controller wake-up periods by enabling a special control pin from the firmware, i.e. IO37.

<add some photos>

##### "Measurement" mode
In addition, with the use of Jumpers the user may control the "measurement" mode.
There are 5 jumper sets:
- __J5__ & __J6__ controls the __SDI-12 Sensor Port 1 and 2__ respectively
- __J3__ & __J4__ controls the __4-20mA Sensor Port 1 and 2__ respectively
- __J7__ controls the single __Digital Port__
The operation is controlled as follows:
- If jumpers enable the __"always-on" mode__ (left-center pins), then the sensor data can be __accessed continuously__.
- If jumpers enable the __"on-demand" mode__ (center-right pins), then the sensor data can be __accessed only when the proper control pin is enabled__.
This is the most power-efficient mode. The control pins are:
  - __SDI-12__ Sensors: __IO42__ & __IO48__ for Port 1 & Port 2 respectively
  - __4-20mA__ Sensors: __IO7__ & __IO8__ for Port 1 & Port 2 respectively
  - __Pulse Counter Sensor__: __IO6__

<add some photos>

##### 4-20mA Sensors Connection Instructions
Below you may find the proper connection instructions for 2-wire/4-wire sensors in case internal (own board) or external power supply unit is used:

- Sensor Type: __2-wire__
  - Power Supply: __Internal__
    - Sensor PWR pin connected to VIN board port
    - Sensor OUT pin connected to OUT board port
  - Power Supply: __External__
    - Sensor PWR pin connected to External Supply Positive Pin (+)
    - Sensor GND pin connected to External Supply Negative Pin (-)
    - Sensor OUT pin connected to OUT board port


- Sensor Type: __4-wire__
  - Power Supply: __Internal__
    - Sensor PWR pin connected to VIN board port
    - Sensor 1st GND pin connected to GND board port
    - Sensor 2nd GND pin connected to same GND board port
    - Sensor OUT pin connected to OUT board port
  - Power Supply: __External__
    - Sensor PWR pin connected to External Supply Positive Pin (+)
    - Sensor 1st GND pin connected to External Supply Negative Pin (-)
    - Sensor 2nd GND pin connected to GND board port
    - Sensor OUT pin connected to OUT board port

### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _planned_ |
| **FCC**  | _planned_ |
| **RoHS** | _planned_ |

## Custom designs

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
