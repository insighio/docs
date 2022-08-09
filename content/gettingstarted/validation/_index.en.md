---
title: Validate
identifier: "gettingstarted@validation"
parent: "gettingstarted"
weight: 90
---

By completing the [Configure Device]({{< relref "../configuration/_index.en.md" >}}) procedure, the device is ready to run the selected scenario and upload the data from the selected measurements.

{{% notice note %}}
**Pro Tip**: the [Configure Device]({{< relref "../configuration/_index.en.md" >}}) procedure is responsible of generating a configuration file that describes the selected board setup, the network configuration and the enabled measurements. This file can be retrieved by downloading file **/apps/demo_console/demo_config.py** for the [insigh.io cellular device]({{< relref "../../hardware/insighio-cellular-weigh-scale.md" >}}) and **/apps/demo_console/demo_config.py** for Pycom devices ([insigh.io generic host board]({{< relref "../../hardware/insighio-board-generic.md" >}}), [insigh.io SDI-12 host board]({{< relref "../../hardware/insighio-board-sdi12.md" >}})). See **[Sample config files]({{< relref "../../firmwareapi/sampleconfigfiles/_index.en.md" >}})** for examples per network technology.

{{% /notice %}}

# Demo Scenario

Our source code contains a demo scenario that can be used as a reference for using the insigh.io board and our libraries. That scenario is coded in the file **/apps/demo_console/demo_scenario.py**. Each of the main steps included in the scenario can be monitored visually as they are identified by a different color lighting of Pycom's LED.

|                                        LED color                                         |                     Scenario Step                     |
| :--------------------------------------------------------------------------------------: | :---------------------------------------------------: |
|  blinking **{{< raw-html >}}<span style="color: #0000FF">blue</span>{{< /raw-html >}}**  |                  Initializing device                  |
| blinking **{{< raw-html >}}<span style="color: #800080">purple</span>{{< /raw-html >}}** |  Web UI waiting for client (only after hard reboot)   |
|  solid **{{< raw-html >}}<span style="color: #800080">purple</span>{{< /raw-html >}}**   | Web UI with connected client (only after hard reboot) |
|   solid **{{< raw-html >}}<span style="color: #0000FF">blue</span>{{< /raw-html >}}**    |            Executing enabled measurements             |
|    solid **{{< raw-html >}}<span style="color: #FF0000">red</span>{{< /raw-html >}}**    |                 Connecting to network                 |
|   solid **{{< raw-html >}}<span style="color: #008000">green</span>{{< /raw-html >}}**   |           Network connected, uploading data           |
|                                           off                                            |                     in deep sleep                     |

<!-- Follows an example video shows how the LED colouring is affected based on the scenario progress. Key points of the video are:

- In step 6 of Web UI, **Finish** button is pressed
- Device will reboot to start running the scenario
- Connect to the network through the typical SSID to regain network connectivity
- Device gets initialized, reads sensors and uploads data
- Switch the view to console.insigh.io tab where the **Device Info** view is still open
- In the **Live View** section of the page, the uploaded data will be displayed as soon as they are processed
- **Device Info** view will be updated automatically with each incoming message.

{{< video src="demo-scenario" >}} -->
