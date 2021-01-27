---
title: Validate
weight: 30
---

By completing the [Configure Device]({{< relref "../configuration/_index.en.md" >}}) procedure, the device is ready to run the selected scenario and upload the data from the selected measurements.

{{% notice note %}}
**Pro Tip**: the [Configure Device]({{< relref "../configuration/_index.en.md" >}}) procedure is responsible of generating a configuration file that describes the selected board setup, the network configuration and the enabled measurements. This file can be retrieved by downloading file **/flash/apps/demo-console/demo_config.py** from the device. See **[Sample config files]({{< relref "../../firmwareapi/sampleconfigfiles/_index.en.md" >}})** for examples per network technology.

{{% /notice %}}

# Demo Scenario

Our source code contains a demo scenario that can be used as a reference for using the insigh.io board and our libraries. That scenario is coded in the file **/flash/apps/demo-console/demo_scenario.py**. Each of the main steps included in the scenario can be monitored visually as they are identified by a different color lighting of Pycom's LED.

|                                       LED color                                        |           Scenario Step           |
| :------------------------------------------------------------------------------------: | :-------------------------------: |
| blinking **{{< raw-html >}}<span style="color: #61A8DD">blue</span>{{< /raw-html >}}** |        Initializing device        |
|  solid **{{< raw-html >}}<span style="color: #61A8DD">blue</span>{{< /raw-html >}}**   |  Executing enabled measurements   |
|   solid **{{< raw-html >}}<span style="color: #C53247">red</span>{{< /raw-html >}}**   |       Connecting to network       |
|  solid **{{< raw-html >}}<span style="color: #13A42A">green</span>{{< /raw-html >}}**  | Network connected, uploading data |
|                                          off                                           |           in deep sleep           |
