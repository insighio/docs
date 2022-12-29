---
title: Firmware APIs
pre: "<b>3. </b>"
chapter: true
identifier: "firmwareapi"
weight: 1000
---

# Firmware APIs

This chapter is focused on documenting all reusable software functionalities that can be found in insigh.io Node software available in Github: https://github.com/insighio/insighioNode.

insigh.io libraries have been tested on stock ESP32 firmware and [Pycom's latest firmware release](https://github.com/pycom/pycom-micropython-sigfox/releases/tag/v1.20.2.r4)

This chapter is divided into 4 sections:

1. [Firmware Flashing Guide]({{< relref "./flashing/_index.en.md" >}})
    - Description on how to flash [insigh.io's node firmware](https://github.com/insighio/insighioNode) to device.
1. [API]({{< relref "./api/_index.en.md" >}})
    - the documentation of the libraries included in the [lib folder](https://github.com/insighio/insighioNode/tree/main/insighioNode/lib) of the `insighioNode`
1. [LoRA]({{< relref "./lora/_index.en.md" >}})
    - a thorough description of the custom LoRA Encoding Protocol accompanied by the corresponding Decoder code sample in Javascript which can be used in any LoRA server / application.
1. [Sample config files]({{< relref "./sampleconfigfiles/_index.en.md" >}}):
    - Sample configuration files for all variants of device configurations that be produced by Web UI configurator as provided by the web_server.py in `insighioNode` code.
