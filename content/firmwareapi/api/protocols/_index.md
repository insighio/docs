---
title: protocols
identifier: "firmwareapi@api@protocols"
parent: "firmwareapi@api"
weight: 1300
---

A selection of modules for various transmission protocols. Typically `MQTT` is used when network is over WiFi to have the full benefits of publish/subscribe and `CoAP` is used over NBIoT to minimize protocol size overheads.

- [MQTT]({{< relref "./mqtt_client.md" >}})
- [CoAP]({{< relref "./coap_client.md" >}})
- [UDP]({{< relref "./udp_client.md" >}})
