---
title: Device List
identifier: "cloudplatform@uioverview@devicelist"
parent: "uioverview"
weight: 5250
---

In the previous articles, the focus has been to managing a single device. Though, there is often the necessity to view or execute multiple devices at once. This requirement if fulfilled by the __Device List View__. 

![Device List](/images/console_tutorial/device_list.png?width=60pc)

The main view provides the list of all devices, populated with the __Last Seen Timestamp__ and the device's communication network type. In that way, the view provides a quick overview of each device. 

The multi-selection option provides a couple of enhanced features: 

#### Export

The __Export__ button can provide a quick CSV file containing all info included in the list view. If specific devices are selected, only those will be exported. Else, all devices are included.

#### Batch Remote Configuration 

By selecting only one device in the list and pressing the "Batch Remote Configuration", the same [Device Configuration Wizard]({{< relref"../deviceInfo#remote-configuration" >}}) that was mentioned in [Device Info article]({{< relref"../deviceInfo" >}}) will be shown to directly set the device configuration. 

When multiple devices are selected, the [Device Configuration Wizard]({{< relref"../deviceInfo#remote-configuration" >}}), auto handling the multiple Communication Keys and either sending one request per selected device or generates a compressed file with all the configuration files as requested. 

#### OTA

Similar to the Remote Configuration, OTA requests can be sent in batch to all selected devices or can batch cancel all their pending requests.