---
title: Console
pre: "<b>4. </b>"
identifier: "cloudplatform"
weight: 5000
---

## Overview

[console.insigh.io](https://console.insigh.io) is a scalable and flexible IoT cloud platform. It supports well-established IoT communication protocols, therefore it is not restricted to insigh.io nodes, but also supports other third-party IoT devices. Moreover, integration with third party platforms for data ingestion as well as data forwarding is also supported.

The Console's main features are the following:

- Device management and provisioning (e.g., remote configuration, over-the-air updates)
- Data management and visualization
- Security and access control
- Several communications protocols support (MQTT, HTTP, CoAP)
- Alarms for automated monitoring
- Integration with third-party platforms for
  - Data forwarding (_Integrations_ service)
  - Data ingestion (_Plugins_ service)

## Entities

### Projects

A project is the higher-level entity that groups together other entities and services. Devices, channels, dashboards, integrations, plugins and alarms are all linked to a specific project. Users may have access to multiple projects and projects can be shared across multiple users with different roles.

### Devices

A device represents an IoT device and is linked to a specific project. Users that have access to that project also have access to the device. When a device is created, it is assigned an ID and a key. These are the credentials that the device uses to authenticate and communicate with the Console. Apart from insigh.io devices, Console also supports third-party devices, either directly (the devices need to support the message format and the measurements API), or indirectly via the _Plugins_ service.

### Channels

Channels are entities that enable the communication between the device and the platform. Each project contains two channels; a _data_ channel and a _control_ channel. The data channel is used for sending measurements to the Console. The control channel is used for two-way communication between the device and the Console, mainly for remote configuration and over-the-air updates. Both channels are automatically created when the first device of the project is created.

### Dashboards

Users can create dashboards for data visualization. Dashboards group together widgets. Various widget types are supported (e.g., line charts, bar charts, text areas, tables, pie charts, etc.). Depending on the widget type, users can create widgets to plot multi-device and multi-measurement information on the same widget.

### Packages

For insigh.io devices, users can perform over-the-air (OTA) updates via the Console. They can create packages of the new firmware version (which is open source) and request an OTA update. The device(s) will then download the package whenever it firstly communicates with the Console. For more information on packages, please check the [Packages section]({{< relref "./ui/packages/_index.en.md" >}})

The following sections contain tutorials, walk-throughs and tips on using [console.insigh.io](https://console.insigh.io) platform.
