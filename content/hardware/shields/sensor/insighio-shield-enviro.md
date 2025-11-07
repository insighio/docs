---
title: Environmental Monitoring
identifier: "hardware@shields@sensor-board@insighio-shield-enviro"
parent: "hardware@shields@sensor-board"
weight: 30
---

![enviro shield](/images/deviceimages/insighio-shield-enviro.png?width=25pc)

### Scope

An ultra versatile and flexible shield, providing support for multiple SDI-12, Modbus-RTU, Analogue/4-20mA and Pulse output sensors. It is mainly applicable to Agriculture, Environmental and Industrial Monitoring applications.

### General Information

|                                  |
| :------------------------------- | :------------------------------------------------------------------------------------------------ |
| **Host board**                   | [insigh.io main board](../../../board/latest)                                                     |
| **Version**                      | v1.1.1                                                                                            |
| **Supported Digital Interfaces** | 1 x SDI-12 & 1 x Modbus-RTU & 4 x Analogue 16-bit / 4-20mA & 2 x Pulse Counter                    |
| **Sensor Headers**               | Fixed terminal block screw connection with wire protector                                         |
|                                  | 2x6-pin (SDI-12/Pulse Counter & Modbus-RTU/Pulse Counter) & 1x12-pin (Analogue 0-3.3V / 4-20mA)   |
| **Dimensions (L x W)**           | 75.57 x 51.94 mm                                                                                  |
| **Weight**                       | 16 g                                                                                              |
| **Software Support**             | To use this shield you need [insighioNode](https://github.com/insighio/insighioNode/) firmware v3 |
| **Deep Sleep Current**           | 100 uA (typical)                                                                                  |

### Example Applications

- **Precision agriculture**
  - Soil moisture, Electrical Conductivity, Volumetric Water Content, Temperature
- **Weather monitoring**
  - Wind direction/speed, Rain, Solar radiation
- **Environmental monitoring**
  - Water flow, water quality, air quality

### Sensors Support (Hardware & Software)

#### Power Supply Features

|                           |                                                                                                                                                            |
| :------------------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Supply Voltage**        | 5V/9V/12V DC (selected via jumper)                                                                                                                         |
| **Operation Modes**       | Jumper J1 for controlling the board power mode ("REG ON")                                                                                                  |
|                           | Jumper J2 for controlling supply voltage level (5V/9V/12V)                                                                                                 |
|                           | Jumpers J3,J4,J5 for controlling the sensor power mode for SDI-12/Modbus-RTU/Analogue independently ("Always on/On demand")                                |
|                           | Jumper J12 for controlling the analog sensor operation mode between Analog and 4-20mA operation (_Leave open for Analog operation, Use jumper for 4-20mA_) |
| **Maximum Drawn Current** | 300 mA                                                                                                                                                     |

#### SDI-12 Interface

|                              |                                                                                                                                                                 |
| :--------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Number of Sensors**        | 1 x Physical Port with 3 pins (VIN,OUT,GND)                                                                                                                     |
|                              | Up to 10 sensors with external combiner                                                                                                                         |
| **Sensors Software Support** | SDI-12 Commands Implementations: Measurement (C, M, R), Verification (V), Extended (X) and additional (e.g. M1, C1)                                             |
| **Example Tested Sensors**   | TEROS-12 (METER), TDR-315H (ACCLIMA), Sap Flow (IMPLEXX), LI-710 (LI-COR), Shandong Renke Weather (Weather), ATMOS 41 (METER), Aquatroll Water Sensor (In situ) |

#### Modbus-RTU Interface

|                              |                                                                                                                                       |
| :--------------------------- | :------------------------------------------------------------------------------------------------------------------------------------ |
| **Number of Sensors**        | 1 x Physical Port with 4 pins (VIN,A,B,GND)                                                                                           |
|                              | Multiple Slaves with external combiner                                                                                                |
| **Sensors Software Support** | Configurable System Settings: Baud rate, Data bits, Stop bits, Parity                                                                 |
|                              | Configurable Slave(s) Settings: Address, Register, Register Type (Holding/Input), Data Format (Integer, Float), Measurement Precision |
| **Example Tested Devices**   | Shandong Renke Weather (Weather), Air Quality (PMBsense), IDEC (Industrial PLC)                                                       |

#### Analogue/4-20mA Interface

|                              |                                                                                                                                                   |
| :--------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Number of Sensors**        | 4 x Physical Ports with 3 pins each (VIN,OUT,GND), where VIN is common across all ports                                                           |
| **Sensors Software Support** | Configurable Dedicated ADS 16-bit Voltage Range: 0:256mV, 0:512mV, 0:1.024V, 0:2.048V, 0:3.3V                                                     |
|                              | Configurable operation between Analog and 4-20mA per port through J12 4-20mA selector. (_Leave open for Analog operation, Use jumper for 4-20mA_) |
|                              | Option for transformation formula (e.g. when an external resistor is used to transform 4-20mA current sensing to voltage input)                   |
| **Example Tested Devices**   | Edinburgh Guardian NG (Gas)                                                                                                                       |

#### Pulse Counter Interface

|                                 |                                                                                |
| :------------------------------ | :----------------------------------------------------------------------------- |
| **Number of Supported Sensors** | 2 x Physical Ports with 2 pins each (OUT, GND)                                 |
| **Implementation**              | Dry Contact (Pulled Up)                                                        |
| **Usage**                       | Pulse Counter: Ultra-Low Power Operation Option for background pulse recording |
| **Max Pulse Frequency**         | 5 kHz                                                                          |
| **Example Tested Sensors**      | Rain Gauge (Pronamic)                                                          |

### Operation Modes

#### Sensors supply voltage

- The shield supports 3 different DC supply voltages to power sensors: **5V, 9V, and 12V**.
- Voltage level is selected via the **J2** jumpers set ("blue jumpers"). By **default** (if no jumper is set) the board provides **5V**.
- A **single voltage level** can be selected across SDI-12/Modbus-RTU/Analogue sensors.
- Use the lowest possible voltage to conserve energy.

##### Board Power mode

There are 2 "power"supply modes for the shield controlled via the **J1** jumper. These modes are applied over all sensors.

- **"Continuous power mode"** : It applies continuous DC voltage (5V/9V/12V) even at deep sleep. This is required by some sensors for condensation avoidance (e.g. Oxygen Sensor SO-411 from Apogee) or special measurement procedure (e.g. Evapotranspiration Sensor which requires 30 min averaging or ATMOS41). To enable this, place the **J1** jumper mode to **"REG_ON"** position.
- **"Low-power" mode**: This is a mode optimized for energy consumption. To enable this place the **J1** jumper to the position next to "REG_ON". In this mode, the sensors are powered only during the micro-controller wake-up periods, which is enabled by the firmware.

##### Sensor Power mode

In addition, with the use of jumpers the user may control each sensor's power mode independently.

There are 3 jumper sets:

- **J3** controls the **SDI-12** Sensor Port
- **J4** controls the **Modbus-RTU** Sensor Port
- **J3** controls the **Analogue** Sensor Ports

These jumpers control the following 2 modes, where each mode can be set independently for SDI-12, Modbus-RTU and Analogue sensors.

- **"Always-on" mode** where the sensor data can be **accessed continuously during the power cycle** .
- **"On-demand" mode** where the sensor data can be **accessed only during the measurement cycle**.

Remarks:

- **"On-demand"** mode is the most energy-efficient one and used in most of the cases.
- **"Always-on"** makes sense when used with **"Continuous power mode"** enabled.

##### Pulse Counter Ultra Low Power Operation Mode

- Many devices, like **rain gauges** or **water flow sensors** generate one or more pulses when certain liquid volume has been observed.
- This is different from typical SDI-12/Modbus-RTU/Analogue measurement scenarios, where we need to periodically wake up our IoT device (e.g. once per our hour), take a measurement and then go to deep sleep.
- Instead, with pulse generating sensors we need to continuously "capture" the pulses while not exhausting battery life.
- For this purpose we use a special operating mode called **ULP**, which hosts the pulse counting measurement into an ultra-low processor drawing less than 400uA for up to 5kHz pulse frequencies.

### Marking

|          |             |
| :------- | :---------- |
| **CE**   | _under way_ |
| **FCC**  | _under way_ |
| **RoHS** | _under way_ |

## Custom designs

The existing boards are highly configurable and expandable so if the existing boards do not fit your need, **[get in contact with us](mailto:info@insigh.io)** and we will tailor a solution for you with your customizations.
