---
title: mqtt_client
identifier: "firmwareapi@api@protocols@mqtt_client"
parent: "firmwareapi@api@protocols"
weight: 1330
---

An MQTT wrapper for console.insigh.io operations with device authentication and proper topic adjustment to communicate with console.insigh.io

```python
from protocols import mqtt_config
from protocols import mqtt_client

protocol_config = mqtt_config.MQTTConfig()
protocol_config.server_ip = "1.1.1.1"
protocol_config.server_port = 5683
protocol_config.message_channel_id = "aaaaa-bbbb-cccccc-ddddddd"
protocol_config.thing_id = "aaaaa-bbbb-cccccc-ddddddd"
protocol_config.thing_token = "aaaaa-bbbb-cccccc-ddddddd"

mqtt_cli = mqtt_client.MQTTClientCustom(cfg.protocol_config)
connectionStatus = mqtt_cli.connect()
mqtt_cli.sendMessage("{test: 1}")
mqtt_cli.disconnect()
```

**Class MQTTClientCustom constructor**

Create a new instance of the MQTTClientCustom. Requires an [MQTTConfig]({{< relref "./mqtt_config.md" >}}) instance with all the information filled as the configuration will be kept for future calls. Will prepare all the authentication and exchange topics required to properly communicate with console.insigh.io backend.

- params:
  - `MQTTConfig instance`. For data fields details please advice [MQTTConfig]({{< relref "./mqtt_config.md" >}}) page

**Methods**

**MQTTClientCustom.connect()**

Initiates the connection to the MQTT broker.

- returns
  - Boolean: connection status

**CoAPClient.sendMessage(message)**

Publish a non-retained MQTT message on topic based on message_channel_id with QoS 1.

- params:
  - `message`: A string message to be transmitted.

**CoAPClient.disconnect()**

Close transmission socket and deinitialize.
