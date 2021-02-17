---
title: external
#pre: "<b>2. </b>"
identifier: "firmwareapi@api@external"
parent: "firmwareapi@api"
weight: 1120
---

Follows a list of the modules in **external** folder that are used as git submodules.

```
import external.<module_name>
```

#### insigh.io developed libraries from scratch

- [microATsocket](https://github.com/insighio/microATsocket): A UDP socket implementation for Pycom devices based on Sequans AT commands to support IPv6 especially when transmitting over NBIoT.
- [microCoAPy](https://github.com/insighio/microCoAPy): A mini implementation of CoAP (Constrained Application Protocol) into MicroPython
- [microSDI12](https://github.com/insighio/microSDI12): A mini SDI-12 implementation for getting sensor info over UART using directional RS-485.

#### forked projects adjusted to our needs

- [senml-micropython-library](https://github.com/insighio/senml-micropython-library) forked from the [KPN SenML implementation](https://github.com/kpn-iot/senml-micropython-library)
- [MicroWebSrv2](https://github.com/jczic/MicroWebSrv2): "Enhanced" implementation of a Web Server to serve our on-device Web UI for configuration of node. Main addition to the library is the introdution of a new keyword: "pyend" to execute code after successful page serving.

#### direct use of 3rd party projects

- [umqtt](https://github.com/micropython/micropython-lib/tree/master/umqtt.simple): umqtt is a simple MQTT client for MicroPython.
