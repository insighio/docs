---
title: Keys
identifier: "firmware@configuration@keys"
parent: "firmware@configuration"
weight: 2200
---

## Introduction
Communication between the node and Console is facilitated through a set of **keys** and **channels**:
- Each node is associated with a unique **```ID```** and a unique **```KEY```**. These are 128-bit universally unique identifiers (UUIDs) generated during device creation in Console.
- Measurements are transmitted over a **```Data Channel```** while Configuration or any other Control information is transmitted over a **```Control Channel```**. Both are unique on a project basis and are also generated following the UUID principle.

## Guide
1. Enter **Console** and go to the ```DeviceInfo``` Page of the target node.
1. Go to **"Quick Device Data Commands"** menu on the top-right of the page (icon ```...```)
1. Copy **JSON** information by clicking the corresponding icon. This action copies all keys and channels in the cliboard.
1. Go back to the Configurator and place the cursor in the first field (**```ID```**). **Paste** will automatically populate all four fields with the proper key/channel information.

The following short video presents the described procedure. On the left-hand side the **Device** page from Console has been loaded, while in the right-hand side the the Local Configurator web page (**Keys** step) is shown.

![keys configuration](/images/firmware/keys.gif?width=75pc)


{{% notice tip %}}
Notice that two connections are needed for this step: 1) Internet connection for accesing Console, and 2) WiFi connection to the node local network for accesing the  configurator. In case a user device (e.g. laptop) with a single WiFi interface is used the user has to either pre-load the Console page before connecting to the local WiFi network of the node or add a second network adapter for handling multiple networks.
{{% /notice %}}