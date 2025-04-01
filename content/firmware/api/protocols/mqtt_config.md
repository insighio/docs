---
title: mqtt_config
identifier: "firmware@api@protocols@mqtt_config"
parent: "firmware@api@protocols"
weight: 1340
---

The module contains class MQTTConfig. Its instance holds the information needed by [mqtt_client]({{< relref "./mqtt_client.md" >}})

```python
from protocols import mqtt_config
import device_info

protocol_config = mqtt_config.MQTTConfig()
protocol_config.server_ip = "1.1.1.1"
protocol_config.server_port = 1883
protocol_config.message_channel_id = "aaaaa-bbbb-cccccc-ddddddd"
protocol_config.thing_id = "aaaaa-bbbb-cccccc-ddddddd"
protocol_config.thing_token = "aaaaa-bbbb-cccccc-ddddddd"
protocol_config.client_name = device_info.get_device_id()[0]
```

**Class CoAPConfig**

Expected fields:

- `server_ip`: The IP of the CoAP server. default value("")
- `server_port`: The port of CoAP service .default value(5683)
- `control_channel_id`: _kept for future usage_
- `message_channel_id`: Channel ID string as provided by the device info. _Created at device creation time._ default value("")
- `thing_id`: Thing ID string as provided by the device info. _Created at device creation time._ default value("")
- `thing_token`: Thing Token string as provided by the device info. _Created at device creation time._ default value("")
- `client_name`: an identification string to use when connecting to the MQTT broker.
