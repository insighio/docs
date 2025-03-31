---
title: coap_config
identifier: "firmware@api@protocols@coap_config"
parent: "firmware@api@protocols"
weight: 1320
---

The module contains class CoAPConfig. Its instance holds the information needed by [coap_client]({{< relref "./coap_client.md" >}})

```python
from protocols import coap_config
protocol_config = coap_config.CoAPConfig()
protocol_config.server_ip = "1.1.1.1"
protocol_config.server_port = 5683
protocol_config.message_channel_id = "aaaaa-bbbb-cccccc-ddddddd"
protocol_config.thing_id = "aaaaa-bbbb-cccccc-ddddddd"
protocol_config.thing_token = "aaaaa-bbbb-cccccc-ddddddd"
```

**Class CoAPConfig**

Expected fields:

- `server_ip`: The IP of the CoAP server. default value("")
- `server_port`: The port of CoAP service .default value(5683)
- `control_channel_id`: *kept for future usage*
- `message_channel_id`: Channel ID string as provided by the device info. *Created at device creation time.* default value("")
- `thing_id`: Thing ID string as provided by the device info. *Created at device creation time.* default value("")
- `thing_token`: Thing Token string as provided by the device info. *Created at device creation time.* default value("")
- `custom_socket`: Provide an already created socket to be used for data transmission. If None, the client will create a new UDP socket. default value(None)