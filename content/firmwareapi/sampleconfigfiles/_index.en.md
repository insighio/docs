---
title: Sample config files
identifier: "firmwareapi@sampleconfigfiles"
parent: "firmwareapi"
weight: 4600
---

The [Configure Device]({{< relref "../../gettingstarted/configuration/_index.en.md" >}}) procedure is responsible of generating a configuration file that describes the selected board setup, the network configuration and the enabled measurements.

This file can be retrieved by downloading file **/flash/apps/demo-console/demo_config.py** from the device. Follows an example on how to download the file using [ampy](https://github.com/scientifichackers/ampy) tool.

```bash
ampy -v -p /dev/ttyUSB0 -b 115200 get /flash/apps/demo-console/demo_config.py demo_wifi_config.py
```

Examples of the generated configuration files per network technology can be found in the next pages:

- [WiFi]({{< relref "./wifi.md" >}})
- [NBIoT]({{< relref "./nbiot.md" >}})
- [LoRA]({{< relref "./lora.md" >}})
