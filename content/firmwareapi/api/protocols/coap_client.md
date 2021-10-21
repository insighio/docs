---
title: coap_client
identifier: "firmwareapi@api@protocols@coap_client"
parent: "firmwareapi@api@protocols"
weight: 1310
---

A module that utilizes [MicroCoAPy]({{< relref "../external.md" >}}) library to communicate through CoAP with [console.insigh.io](https://console.insigh.io)

```python
from protocols import coap_config
from protocols import coap_client

protocol_config = coap_config.CoAPConfig()
protocol_config.server_ip = "1.1.1.1"
protocol_config.server_port = 5683
protocol_config.message_channel_id = "aaaaa-bbbb-cccccc-ddddddd"
protocol_config.thing_id = "aaaaa-bbbb-cccccc-ddddddd"
protocol_config.thing_token = "aaaaa-bbbb-cccccc-ddddddd"

coap_cli = coap_client.CoAPClient(cfg.protocol_config)
connectionStatus = coap_cli.start()

coap_cli.postMessage("{test: 1}")
coap_cli.poll(2000)
coap_cli.stop()
```

### class constructor

**coap_client.CoAPClient(coap_config)**

Create a new instance of the CoAPClient. Requires a [CoAPConfig]({{< relref "./coap_config.md" >}}) instance with all the information filled as the configuration will be kept for future calls. Will prepare all the authentication and exchange URLs required to properly communicate with [console.insigh.io](https://console.insigh.io) backend.

-   params:
    -   `coap_config`: `CoAPConfig instance`, for data fields details please advice [CoAPConfig]({{< relref "./coap_config.md" >}}) page

### class methods

**CoAPClient.start()**

Initializes socket and callbacks to be ready for data transmission.

-   returns
    -   Boolean: connection status

**CoAPClient.postMessage(message)**

Publish an Non-Confirmable CoAP message on topic based on message_channel_id as JSON.

-   params:
    -   `message`: A string message to be transmitted.

**CoAPClient.loop()**

A request to process messages that have already been received as Publish responses or messages from Subscriptions.

**CoAPClient.poll(timeoutMs=-1)**

Wait for incoming message for specific period of time.

-   params:
    -   `timeoutMs`: the timeout in (ms). If timeout is set to -1, it will wait indefinitely till a message is received.

**CoAPClient.stop()**

Close transmission socket and deinitialize.
