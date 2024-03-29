---
title: Measurements
identifier: "gettingstarted@configuration@measurements"
parent: "gettingstarted@configuration"
weight: 80
---

Step 5 of the Web UI is the selection of the enabled measurements during the demo scenario.

insigh.io boards come in 3 versions based on the sensor connectors that it support and the microcontroller they are based on (refer to [Hardware page]({{< relref "../../../hardware/_index.en.md" >}}) for more information).

The first 6 switches control generic features of the board / firmware:

-   **Battery statistics**: Reports battery voltage and Current consumption
-   **Board humidity/temperature**: All insigh.io boards are equipped with an [**si7021**](https://www.silabs.com/documents/public/data-sheets/Si7021-A20.pdf) or an [**SHT40 IC**](https://cdn.sos.sk/productdata/79/7c/0364ef45/sht40-ad1b-r2.pdf) to be able to provide the humidity and temperature of the board.
-   **Board health statistics**: Reports extended stability info like:
    -   size of allocated memory
    -   remaining free memory
    -   CPU temperature
    -   reset cause code
-   **Network statistics**: Based one the selected network type (WiFi, Cellular, LoRA), this option provides KPIs of the network connection
-   **Over the Air Updates**: Whether to enable looking for incoming update/reconfiguration events.
-   **Temperature Unit**: select between Celsius and Fahrenheit for the reported temperature values

Each of the following tabs represent a configuration pack for the selected variant of the insigh.io board.

After setting up board-specific options, press **Save**.

### 16 pin with 2xI²C, 2xDigital/Analog, 2xAnalog

Supports:

-   2 x I²C selectors with the supported sensors. _This option assumes that all these connected sensors operate at their default I²C ID_
-   2 x Generic Analog measurements
-   2 x Digital Analog measurements. This includes the following options:
    -   Generic Analog measurement
    -   Digital sensor (ex. DHT11 / DHT 22)
    -   OneWire Sensor (ex. ds18x20)

![default insigh.io board measurements](/images/webui-measurements-default.gif?width=50pc)

### 6 pin with SDI-12 support.

Supports:

-   2 x SDI-12 sensor reading. If enabled, select the SDI-12 address that the device is operating on.
    -   **Important**: addresses must be preconfigured to not collide

![SDI-12 insigh.io board measurements](/images/webui-measurements-sdi12.gif?width=50pc)

### Cellular board with 2xI²C, Digital (OneWire), Load Cell, GPS

Supports:

-   2 x I²C selectors with the supported sensors. _This option assumes that all these connected sensors operate at their default I²C ID_
-   1 x Analog Digital measurements. This includes the following options:
    -   Generic Analog measurement
    -   Digital sensor (ex. DHT11 / DHT 22)
    -   OneWire Sensor (ex. ds18x20)
-   Weight Scale: enable measuring values of the load cell and converting it into grams (g). If selected, the Web UI configurator will guide you through the calibration steps through its next pages.
-   GPS: get the precise location of the device using embedded GPS in the cellular modem.

![insigh.io cellular board measurements (scale, GPS)](/images/webui-measurements-scale-gps.gif?width=50pc)
