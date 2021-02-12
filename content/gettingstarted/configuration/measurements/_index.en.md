---
title: Measurements
identifier: "gettingstarted@configuration@measurements"
parent: "gettingstarted@configuration"
weight: 80
---

Step 5 of the Web UI is the selection of the enabled measurements during the demo scenario.

insigh.io board comes in 2 versions based on the sensor connectors that it support (refer to [Hardware page]({{< relref "../../../hardware/_index.en.md" >}}) for more information).

The first 4 switches control generic features of the board / firmware:

- **Battery statistics**: Reports battery voltage and Current consumption
- **Board humidity/temperature**: All insigh.io boards are equipped with an [**si7021 IC**](https://www.silabs.com/documents/public/data-sheets/Si7021-A20.pdf) to be able to provide humidity and temperature of the board.
- **Board health statistics**: Reports extended stability info like:
  - size of allocated memory
  - remaining free memory
  - CPU temperature
  - reset cause code
- **Network statistics**: Based one the selected network type (WiFi, NBIoT, LoRA), this option provides KPIs of the network connection

The switch by the name "Board version" enables the supported measurements based on the version of the insigh.io board.

After setting up board-specific options, press **Save**.

Finally, in step 6, press **Finish** to apply changes to the board.

### 16 pin with 2xI²C, 2xDigital/Analog, 2xAnalog

Supports:

- 2 x I²C selectors with the supported sensors. _This option assumes that all these connected sensors operate at their default I²C ID_
- 2 x Generic Analog measurements
- 2 x Digital Analog measurements. This includes the following options:
  - Generic Analog measurement
  - Digital sensor (ex. DHT11 / DHT 22)
  - OneWire Sensor (ex. ds18x20)

![default insigh.io board measurements](/images/webui-measurements-default.gif?width=50pc)

### 6 pin with SDI-12 support.

Supports:

- 2 x SDI-12 sensor reading. If enabled, select the SDI-12 address that the device is operating on.
  - **Important**: addresses must be preconfigured to not collide

![SDI-12 insigh.io board measurements](/images/webui-measurements-sdi12.gif?width=50pc)
