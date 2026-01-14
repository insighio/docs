---
title: Firmware
pre: "<b>3. </b>"
chapter: true
identifier: "firmware"
weight: 1000
---


# Firmware

This chapter provides the basic information for flashing and using the **insigh.io node firmware**:

#### [Flashing Guide]({{< relref "./flashing/_index.en.md" >}})
  - How to flash [insigh.io's node firmware](https://github.com/insighio/insighioNode) to an insigh.io node.

{{% notice tip %}}
The firmware is installed in the **main board** and is common across all sensing & connectivity shields.
{{% /notice %}}

#### [Web Configuration]({{< relref "./configuration/_index.en.md" >}})
   - How to configure the insigh.io node using the **local Web User Interface**.

{{% notice note %}}
After configuring the node locally using the Web UI, **remote configuration** is available via the Console.
{{% /notice %}}

#### [LoRa]({{< relref "./lora/_index.en.md" >}})
   - Information specific on **LoRa operation** on insigh.io node firmware
     - Custom LoRaWAN encoding protocol
     - Decoder sample for use in any LNS
   
#### [Measurements]({{< relref "./measurements/_index.en.md" >}})
   - A list of default board measurements
      - On-board diagnostics
      - Network metadata
      - Debugging information



{{% notice info %}}
The firmware is an open-source software project hosted and maintained in [Github](https://github.com/insighio/insighioNode). It is continuously improved and enhanced, so when starting a new project we recommend to get the latest version.
{{% /notice %}}