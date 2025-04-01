---
title: Validate
identifier: "gettingstarted@validation"
parent: "gettingstarted"
weight: 90
---

By completing the [Configure Device]({{< relref "../configuration/_index.en.md" >}}) procedure, the device is ready to run the selected scenario and upload the data from the selected measurements.

{{% notice tip %}}
For firmware version: v2.11.0+, after each configuration there is a file system optimization procedure. This takes place on first boot after the configuration and lasts ~1 minute with RGB light flashing in multiple colors.
{{% /notice %}}

{{% notice note %}}
**Pro Tip**: the [Configure Device]({{< relref "../configuration/_index.en.md" >}}) procedure is responsible of generating a configuration file that describes the selected board setup, the network configuration and the enabled measurements. This file can be retrieved by downloading file **/apps/demo_console/demo_config.py** for the [insigh.io cellular device]({{< relref "../../hardware/custom/insighio-cellular-weigh-scale.md" >}}) and **/apps/demo_console/demo_config.py** for Pycom devices ([insigh.io generic host board]({{< relref "../../hardware/custom/insighio-board-generic.md" >}}), [insigh.io SDI-12 host board]({{< relref "../../hardware/custom/insighio-board-sdi12.md" >}})). See **[Sample config files]({{< relref "../../firmware/sampleconfigfiles/_index.en.md" >}})** for examples per network technology.

{{% /notice %}}

# Demo Scenario

Our source code contains a demo scenario that can be used as a reference for using the insigh.io board and our libraries. That scenario is coded in the file **/apps/demo_console/demo_scenario.py**. Each of the main steps included in the scenario can be monitored visually as they are identified by a different color lighting of Pycom's LED.

|                                                                        LED color                                                                         |                         Scenario Step                          |
| :------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------: |
|                                                                  blinking random colors                                                                  | File system optimization procedure (firmware version v2.11.0+) |
| blink **{{< raw-html >}}<span style="color: #FFFFFF; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">white</span>{{< /raw-html >}}** |                      Initializing device                       |
|                                 blinking **{{< raw-html >}}<span style="color: #800080">purple</span>{{< /raw-html >}}**                                 |       Web UI waiting for client (only after hard reboot)       |
|                                  solid **{{< raw-html >}}<span style="color: #800080">purple</span>{{< /raw-html >}}**                                   |     Web UI with connected client (only after hard reboot)      |
|                                   solid **{{< raw-html >}}<span style="color: #0000FF">blue</span>{{< /raw-html >}}**                                    |                 Executing enabled measurements                 |
|                                    solid **{{< raw-html >}}<span style="color: #FF0000">red</span>{{< /raw-html >}}**                                    |                     Connecting to network                      |
|                                   solid **{{< raw-html >}}<span style="color: #008000">green</span>{{< /raw-html >}}**                                   |               Network connected, uploading data                |
|                                                                           off                                                                            |                         in deep sleep                          |
