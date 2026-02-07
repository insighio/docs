---
title: Local Configurator
identifier: "firmware@configuration"
parent: "firmware"
weight: 1010
---

## Overview

The local configurator is an integrated feature of the firmware that allows to fully configure the node in a user friendly way. It relies on a Web Server running in the node and can be accessed by any nearby WiFi-capable device like a PC, a smartphone or a tablet via a Browser. It opens a step-by-step wizard exposing all the available settings to the end user.

It groups configuration into 4 categories:

-   **[Network]({{< relref "./network" >}})**: choose from a wide range of connectivity technologies and setup network-specific connection parameters.
-   **[Keys]({{< relref "./keys" >}})**: enter keys for node-Console communication, as acquired from _[onboarding]({{< relref "../../cloudplatform/ui/devices/deviceinfo" >}})_.
-   **[Measurements]({{< relref "./measurements" >}})** enable specific sensor ports & settings along with metadata monitoring in accordance with the selected shield.
-   **[Timing]({{< relref "./timing" >}})** setup periodic measurement and data reporting times.

Configuration is finalized with a **[Verification]({{< relref "./verify" >}})** step which provides an overview of the selected parameters and applies the changes.
Before presenting in detail the above configuration options, we explain how to launch and access the tool.

## Configurator Launch

#### How to Enable the Configurator

The Configurator is accessible only after a **hard reset** (power off/on). During this procedure, the node becomes a **WiFi Access Point** and waits for connections from WiFi-capable devices acting as Clients.

Each node:
- Broadcasts a WiFi **SSID** with the following format: **insigh-<last 4 digits of mac address>** (ex. _insigh-5fa1_), having
- Connection **password**: _insighiodev_

#### WiFi Access Point mode indicator

The WiFi Access Point is ready for connection around 5-10 seconds after power on. Its ready state is identified by the LED that blinks **{{< raw-html >}}<span style="color: #800080">magenta</span>{{< /raw-html >}}**. As soon as a client is successfully connected to the Access Point, the LED will stop blinking.

#### WiFi Access Point mode timeouts

The WiFi Access Point will remain active for:

-   **50 seconds**, if no WiFi client gets connected
-   **5 minutes**, if any WiFi client gets connected

### Step-by-step Guide

1. Power-on or hard-reset the node
1. Wait for the RGB led to start blinking **{{< raw-html >}}<span style="color: #800080">magenta</span>{{< /raw-html >}}**.
1. On a PC, tablet, or smartphone:
   - Look for a WiFi network with **SSID:** _insigh-XXXX_
   - Connect to this network with  **password**: _insighiodev_
1. Launch a browser and open to the Web UI URL: **[http://192.168.4.1](http://192.168.4.1)**
1. Login with credentials:
    - **username:** _admin_
    - **password:** _insighiodev_
1. Follow the wizard steps as described in the coming pages.   