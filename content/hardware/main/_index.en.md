---
title: Main Board
identifier: "hardware@main-board"
parent: "hardware"
weight: 1
---

![TAT image](/images/deviceimages/insighio-main-latest.png?width=40pc)

### General Information
|                                             |
| :------------------------------------------ | :------------------------------------------------------------------------------------------    |
| **Microcontroller**                         | Espressif ESP32-S3 Module                                                                      |
| **Connectivity**                            | WiFi, Bluetooth, NB-IoT/LTE-M with GSM fallback (Nano-SIM Holder)                              |              
| **GNSS**                                    | Embedded GPS, BeiDou, Galileo, GLONASS and QZSS                                                |
| **Power Supply**                            | Battery (primary & rechargeable), USB, Solar Panel                                             |
| **Onboard Diagnostic Sensors**              | Temperature & Humidity                                                                         |
| **Misc**                                    | Serial Port (UART) or USB for Debugging                                                        |
| **Switch**                                  | Internal switch & support for external switch                                                  |
| **Indicators**                              | Various LEDs                                                                                   |
| **Software & Tools**                        | Micropython (aligned with version 1.19)                                                        |
|                                             | Open-source libraries & example scenarios @ [Github](https://github.com/insighio/insighioNode) |
|                                             | Local Web Configurator through WiFi                                                            |
| **Dimensions (L x W x H)**                  | 77.47 (83.5*) x 62.23 x 16.7 mm (* with embedded wifi antenna)                                 |
| **Weight**                                  | 28 g                                                                                           |
| **Current version**                         | 1.0.4                                                                                          |
| **SKU**                                     | INS-B-MAN                                                                                      |


### Micro-Controller
|                                                          |
| :------------------------------------------ | :----------|
| **Model**                            | ESP32-S3-WROOM-1  |
| **Flash**                            | 8 MB (Embedded)   |              
| **Memory RAM**                       | 2 MB (Embedded)   |

### Power Supply
|                 |                                                                  |                                      |      |      |       |
| --------------- | ---------------------------------------------------------------- | ------------------------------------ | ---- | ---- | ----- |
| **USB**         | **Port (Port ID)**                                               | **Input Voltage**                    |
|                 | Micro USB (J2)                                                   | Min.                                 | Typ. | Max. | Units |
|                 |                                                                  | 4.5                                  | 5    | 5.5  | V     |
| **Battery**     | **Port (Port ID)**                                               | **Nominal Characteristics**          |
|                 | JST (J1)                                                         | 1 x Rechargeable LiPo/Li-Ion 1S1C 3.7-4.2 V |
| **Solar Panel** | **Port (Port ID)**                                               | **Input Voltage**                    |
|                 | Fixed Terminal Block with push-in connection                     | Min.                                 | Typ. | Max. | Units |
|                 | *No tools required* (J4)                                         | 5.5                                  | 6    | 7  | V     |

### Connectivity
|                                             |
| :------------------------------------------ | :----------|
| **WiFi & Bluetooth**                        | Embedded on Micro-controller  |
| **Cellular (NB-IoT/LTE-M/GSM)**             | Quectel BG600 Modem  |      

### Operating Conditions
|                                       |          |
| :------------------------------------ | :------- |
| **Microcontroller Operating Voltage** | 3.3 V    |
| **Charging Current Limit**            | 440 mA   |
| **Maximum Drawn Current (modem)**     | 3 A      |
| **Maximum Drawn Current (sensors)**   | 250 mA   |
| **Operational Temperature**           | 0 – 50 C |
| **Charging Temperature**              | 0 – 50 C |

### Switches
|                                       |          |
| :------------------------------------ | :------- |
| **S1** | Controls power supply to the micro-controller (the battery charging process is not affected)    |
| **S2** | Tactile switch for rebooting the micro-controller   |
| **S3** | Tactile switch for activating the micro-controller’s bootloader (needed only for fw upgrade)     |
| **J4** | Port for connecting external switch |

{{% notice info %}}
For controling the board using the External Switch, S1 (internal switch) should be in OFF state. If S1 is in ON state, the external switch is bypassed.
{{% /notice %}}

### Indication LEDs

#### Charging State Indication (RED LED)
| Charge cycle state    | LCR LED  |
| :-------------------- | :------- |
| **No input**          | OFF      |
| **Temperature fault** | BLINKING |
| **No battery**        | BLINKING |
| **Charging**          | ON       |
| **Charge complete**   | OFF      |

#### Modem State Indication (RED LED)
| Modem state           | LCR LED                               |
| :-------------------- | :------------------------------------ |
| **Disabled**          | OFF                                   |
| **Network Search**    | BLINKING SLOWLY (OFF most of the time)|
| **Idle**              | BLINKING SLOWLY (ON most of the time) |
| **Transferring Data** | BLINKING QUICKLY                      |

#### Operational State Indication (RGB LED)

| RGB LED Color & Status                                                                                                                                     | Operational                                            |
| :------------------------------------------------------------------------------------------------------------------------------------------------------:   | :------------------------------------------------------------: |
| blinking random colors                                                                                                                                     | File system optimization procedure (firmware version v2.11.0+) |
| blink **{{< raw-html >}}<span style="color: #FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">white</span>{{< /raw-html >}}** | Initializing device                                            |
| blinking **{{< raw-html >}}<span style="color: #800080">purple</span>{{< /raw-html >}}**                                                                 | Web UI waiting for client (only after hard reboot)             |
| solid **{{< raw-html >}}<span style="color: #800080">purple</span>{{< /raw-html >}}**                                                                    | Web UI with connected client (only after hard reboot)          |
| solid **{{< raw-html >}}<span style="color: #0000FF">blue</span>{{< /raw-html >}}**                                                                      | Executing enabled measurements                                 |
| solid **{{< raw-html >}}<span style="color: #FF0000">red</span>{{< /raw-html >}}**                                                                       | Connecting to network                                          |
| solid **{{< raw-html >}}<span style="color: #008000">green</span>{{< /raw-html >}}**                                                                     | Network connected, uploading data                              |
| solid **{{< raw-html >}}<span style="color: #ffd900ff">yellow</span>{{< /raw-html >}}**                                                                  | Uploading data failed                                          |
| off                                                                                                                                                        | Deep sleep                                                     |

### On-board diagnostics & debug
|                            |                                                                 |
| :------------------------                | :-------------------------------------------------------------  |
| **Battery Voltage**                      | Accurate Measurement of battery voltage even at charging state  |
| **Environment Conditions**               | 1 × on-board temperature/humidity Sensor (based on the SHT40 chip)       |
| **Location**                             | Through embedded GPS (only works outdoors)                      |
| **Debug Port J5**                        | Standard Serial Port (needs an external USB-to-Serial adapter to connect to PC)                    |
| **Debug Port J2**                        | Standard Serial Port                   |


### Special Configurations
|                            |                                                                 |
| :------------------------                | :-------------------------------------------------------------  |
| **Bypass Charger**         | By default R20 (0 Ohm) is not mounted and R15 (0 Ohm) is mounted. In case you need to bypass the charger and power the board solely through a battery then R15 should be removed and R20 should be mounted|
| **Micro-controller Power Line Break**    | By default R26 (0 Ohm) is mounted. In case you need to break the micro-controller’s power line (e.g. for adding a special circuit like a watchdog) then this should be removed|

### Protection
|                                     |                                                                 |
| :---------------------------------- | :-------------------------------------------------------------  |
| **Overcurrent**                     | 4 x Resettable Fuses for battery, solar panel, USB port, and 3.3V regulator paths  |
| **Charge at low/high temperatures** | 1 x Thermistor disabling charging beyond temperature limits |

### Expansion Ports  

#### Sensor Expansion Port
|                             |                                                                 |
| :-------------------------- | :-------------------------------------------------------------  |
| **Port**                    | J9-J10  |
| **Type**                    | 1 x Single-Row & 1 x 2-row 10-pin Female Socket Header |
| **Usage**                   | Attach insigh.io sensor shields or custom applications in breadboards |

#### Connectivity Expansion Port
|                             |                                                                 |
| :-------------------------- | :-------------------------------------------------------------  |
| **Port**                    | J3  |
| **Type**                    | 1 x Custom 10-pin Connector (Part number: 90325-0010) compatible with Ribbon Flex Cable (Part number: 92317-1012) |
| **Usage**                   | Attach insigh.io connectivity shields |



### Pinouts

#### Sensor Expansion Port

| J9    | J10(L) | J10(R) |
| :---- | :--- | :--- |
| IO2   | IO40 | IO35 |
| IO1   | IO18 | IO36 |
| V_SW  | IO17 | IO37 |
| GND   | IO11 | IO41 |
| 3.3V  | IO9  | IO42 |
| GND   | IO8  | IO43 |
| 3.3V  | IO7  | IO44 |
| V_ESP | IO6  | IO48 |
| GND   | IO5  | SCL  |
| S_GND | IO4  | SDA  |

{{% notice info %}}
Orientation as in the board picture. IOs naming refer to corresponding ESP32-S3-WROOM-1 IOs.
{{% /notice %}}

- Power Pins (Output Only)
  - 3.3V  : Constant 3.3V Output from LDO used also to power the micro-controller
  - V_SW  : Internal switch output voltage before the regulator (post-charger output)
  - V_ESP : Used for breaking the micro-controller's power line if needed (see custom configurations)
  - GND   : Common Ground
  - S_GND : Electronically-controlled Ground Pin (ground switch through IO12)

- Other Sensor/Control Pins (Input/Output)
  - SCL (IO38) : I²C Control Line (Already Pulled-up)
  - SDA (IO39) : I²C Data Line (Already Pulled-up)
  - IO43       : UART TXD0 for Debugging/Firmware Flashing using USB-to-Serial Cable (also exposed in separate header "J5")
  - IO44       : UART RXD0 for Debugging/Firmware Flashing using USB-to-Serial Cable (also exposed in separate header "J5")
  - IO4-9      : General I/O, can be used as ADC pins
  - All other pins, except reserved pins mentioned below, can be freely used as digital IOs and power pins with low (up to a few mA) current requirements

- Reserved Pins (Used for internal purposes only)
  - IO3 & IO14  : Measure the battery state (voltage)
  - IO12        : Control (Enable/Disable) the additional ground pin (S_GND)
  - IO21 & IO47 : Control (Power/Set) the RGB LED
  - IO10 & IO13 : Control (Reset/Enable) the Cellular Modem
  - IO15 & IO16 : Serial (UART) Pins for communicating with the Cellular Modem
  - IO19 & IO20 : D-/D+ pins for native USB control


#### Connectivity Expansion Port

| J3   |
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

- GND: Common Ground 
- 3.3V: Used for powering the modem of the shield
- IO40, IO18, IO35, IO36: Free digital pins to use in the shield as input/output
- SDA/SCL: Exposed I²C bus to accomodate compatible devices
- UART1_TX/UART1_Rx: Exposed Serial Bus to accomodate compatible devices (modem, GPS, etc.)

### Marking

|          |           |
| :------- | :-------- |
| **CE**   | _ongoing, expected to be completed in Q1-2026_ |


### Changelog

| Version  | Release Date | Comments
| :-------------------- | :------- | :--------|
| 1.0.4 (latest)         | 05/03/2025       | Change resettable fuses to tolerate higher voltages |
| 1.0.3                  | 20/08/2024       | Minor mechanical changes (holes standoffs) |
| 1.0.2                  | 31/12/2023       | Fix increased deep sleep current due to external switch pulled down resistor |
| 1.0.1                  | 17/03/2023       | Added resettable fuses to solar panel, battery and the output of the 3.3V regulator; Change connector for connectivity shield |
| 1.0.0                  | 29/06/2022       | First stable version with ESP32-S3 & Sensor Expansion Port |


