---
title: Device List
identifier: "cloudplatform@uioverview@devices@devicelist"
parent: "devices"
weight: 250
---

The **Device List** view lists all the project's devices. The list shows information on:

- The device ID
- The device name
- The device tags
- The network that was used to send measurements
- The device firmware
- When the device was last seen

![Device List](/images/console_tutorial/device_list.jpg?width=60pc)

At the page toolbar (top right), users can create a new device using the "Add new" button and can also refresh the list.

At the top of the list, there are several buttons that provide enhanced features:

#### Export

The **Export** button can provide a quick CSV file containing all info included in the list view. If specific devices are selected, only those will be exported. Else, all devices are included.

#### Batch Remote Configuration

By selecting only one device in the list and pressing the "Batch Remote Configuration", the same [Device Configuration Wizard]({{< relref"../deviceInfo#remote-configuration" >}}) that was mentioned in [Device Info article]({{< relref"../deviceInfo" >}}) will be shown to directly set the device configuration.

When multiple devices are selected, the [Device Configuration Wizard]({{< relref"../deviceInfo#remote-configuration" >}}), auto handling the multiple Communication Keys and either sending one request per selected device or generates a compressed file with all the configuration files as requested.

#### OTA

Similar to the Remote Configuration, OTA requests can be sent in batch to all selected devices or can batch cancel all their pending requests.

> 🔐 Project viewers are not allowed to create devices or request Remote Configuration or OTA updates. The relevant buttons are hidden.
