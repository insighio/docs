---
title: Configure Node
identifier: "configure-node@gettingstarted"
parent: "gettingstarted"
weight: 130
---

After completing the platform setup, we are ready to configure and provision the node using the [**local configurator**]({{< relref "../../firmware/configuration/" >}}). In this guide we assume that the node has been already flashed. If not, the user may consult the respective [flashing instructions]({{< relref "../../firmware/flashing/" >}}).

For this tutorial we will assume:
- The node is equipped with the [**Enviro**]({{< relref "../../hardware/shields/sensor/insighio-shield-enviro.md" >}}) shield as shown in the [**hardware guide**]({{< relref "./hardware_setup" >}}) and an 1nce SIM card.
- The following **external sensors/devices** are attached:
  - An SDI-12 sensor (TEROS12 from Meter) configured at address 2
  - A Modbus RTU device, with slave address 2, operating at 9600,N,1 and producing dummy values at Holding Register 10.
  - A device producing dummy DC voltages in the range 0:2V

The configuration steps include:
- **Launch** of the configurator & **Login**
- **Select Network**
- Enter platform **keys**
- **Configure measurement scenario**
- Set **measurement** and **upload** data **timings**


### Step-by-step procedure

#### Launch and access configurator
1. Power on the node and you will see its RGB led **{{< raw-html >}}<span style="color: #800080">blinking magenta</span>{{< /raw-html >}}** color. This means that the local web server has been launched and you have **50 seconds** to connect to it using WiFi.
1. Locate and connect to the **local WiFi network** which is named as _insigh-xxxx_ with the 4 digits corresponding to the last 4 characters of the MAC address. Use  _insighiodev_ as the password.
1. After connecting, the RGB led will stop blinking and become **{{< raw-html >}}<span style="color: #800080">solid magenta</span>{{< /raw-html >}}**.
1. Launch a **Browser** and connect to [**http://192.168.4.1**](http://192.168.4.1). Use _admin_ and _insighiodev_ for **Login**.

![configurator launch](/images/gettingstarted/configurator-launch.png?width=60pc)

#### Network Setup
1. Select **Cellular** network option
1. Keep default **APN** (iot.1nce.net) and **technology preference** (NB-IoT) options.
1. For data transport keep **MQTT** and **IPv4** options, which are fully supported over the specific network.

![configurator network](/images/gettingstarted/configurator-network.png?width=35pc)

#### Enter Console Keys
1. Locate the **JSON** holding the keys from the [**platform setup**]({{< relref "./platform_setup.md" >}}) step and copy it.
1. Place the cursor in the **ID** field and Paste.
1. The fields will be **automatically populated** with the corresponding ID, KEY, Data Channel, and Control Channel information.

From now on the node will be able to authenticate with Console and exchange data and control information.

![configurator network](/images/gettingstarted/configurator-keys.png?width=35pc)

#### Measurement Scenario
##### Generic measurements & settings
1. Select **main board** reported measurements
    - Battery
    - Board (e.g. memory usage)
    - Network (e.g. rssi, lac)
    - Environmental conditions (temperature, humidity) through embedded sensor
    - Location through embedded GPS
1. Optionally add **static metadata** (key-value pairs) to each measurement packet
{{% notice warning %}}
This feature will be discontinued in future versions
{{% /notice %}}
1. Setup **advanced system settings**
- Enable LED notifications
- Enable Over-the-Air Updates
- Enable printout for debugging purposes
- Enable automatic file system optimization (relevant for older firmware versions)
{{% notice info %}}
Users are advised to keep default settings (all enabled).
{{% /notice %}}

##### Sensor-specific measurements & settings

1. Select **Shield**: 
   - For this tutorial we will select the "SDI-12/Modbus/ADC" option in the configurator, as this corresponds to _Enviro_ shield
1. Configure **SDI-12** interface:
    - Define minimum warm-up time for on-demand power supply according to sensor specs
    - Add an "M" SDI-12 command for a sensor at address "2" for getting the default TEROS-12 measurement set used in this tutorial.
1. Configure **Modbus RTU** interface:
    - Setup baudrate, data bits, stop bits, and parity for the bus
    - Add an entry for monitoring the slave-register set for this tutorial.
1. Configure **Analogue** interface:
    - Enable Port 1, assuming the analogue device is connected to the specific port.
    - Set Gain to 2x for maximum precision, as the max voltage reading is 2V.

![configurator measurements](/images/gettingstarted/configurator-measurements.png?width=80pc)

#### Timing
1. Set deep sleep period which is actually the **measurement period** (5 minutes in the tutorial)
2. Keep **batch upload** disabled, so that each measurement is followed by a data upload attempt. 

![configurator timing](/images/gettingstarted/configurator-timing.png?width=30pc)

#### Overview & Apply
Make a final inspection and press **Finish** to apply the selected settings to the node.

![configurator apply](/images/gettingstarted/configurator-apply.png?width=60pc)

### Final Remark
Everything is ready: hardware setup check, configuration check, node onboard in Console check! We can move on to the final validation phase.