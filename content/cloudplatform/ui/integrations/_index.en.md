---
title: Integrations
identifier: "cloudplatform@uioverview@integrations"
parent: "uioverview"
weight: 5400
---

Throughout the previous articles, the data received by the devices are either displayed in their raw form in _Live View_ panels or displayed in _Dashboards_. 

What about the case where the data need to be sent/captured by 3rd party applications?

insigh.io platform offers 3 different ways of accessing the device data as an external application / user.

1. __Directly subscribe on the device Data Channel with MQTT__. Regardless of the protocol that the devices use to upload data, if a user or application subscribes to the topic `channels/<data-channel-id>/messages/#` or `channels/<data-channel-id>/messages/<device-id>` will receive all the raw measurements as soon as they are received by the insigh.io platform.
    * the MQTT subscription, requires username/password. The data channels of each user can only be accessed using the Device ID/Key of any device.
1. __Use HTTP API__: As described in article __[HTTP API description]({{< relref "../../api/">}})__ device data can be queried and retrieved on demand.
1. __Integrations__: Use the build-in __Integrations__ service of insigh.io platform. The service listens to all device messages, and based on filters, it is responsible of redirecting the message to 3rd party systems over MQTT, HTTP or socket.io. It also supports the option to alter the message format using __Decoders__ to match 3rd party system requirements. 

#### MQTT redirection

Setting up an MQTT integration, the service publishes every message received at a selected topic to a 3rd party MQTT broker. First thing of each MQTT integration is to setup the connection details of the remote MQTT broker. The connection details includes:
* MQTT broker URL
* MQTT broker Port
* Username (optional)
* Password (optional)

![Integrations MQTT](/images/console_tutorial/integrations_mqtt.png?width=60pc)

### HTTP redirection

Setting up an HTTP integration, the service calls the provided HTTP API upon receiving every message. For instance, this could be an HTTP API that a remote system requires to store locally the device data. The connection details includes:
* HTTP URL
* HTTP method (POST, PUT)
* Username (optional): if HTTP authentication is required
* Password (optional): if HTTP authentication is required
* Headers: JSON with the custom Headers to be used in the request.
* Query Params: JSON with the query Parameters that the URL might require

![Integrations HTTP](/images/console_tutorial/integrations_http.png?width=60pc)

### socket.io

__under construction__

### Decoders

Regardless the selected communication protocol, each can optionally be altered before forwarded to a 3rd party system. This operation is done by setting up a __Decoder__. 

Each decoder is a __Javascript callback__ that is called for every message that passes the _topic filter_ with: 
* `arguments`:
    * `deviceId`: the device ID as provided by the Device Info view.
    * `senmlMessage`: the raw SenML message as provided by the device.
* `expected return`:
    * any string message. Objects must be stringified before returning.

By default there are a couple of decoders ready to be used that cover very common cases of message decoding. _(the list will be expanded in the future, as requested)_ 
 * `influx DB line`: translate into a line that when posted to an influx service will be immediately stored
 * `JSON`: convert the SenML message into a simple JSON string. Common case is its use in Telegraf.
 * `Custom`: an empty callback ready to be coded to user needs

 Each implementation can be tested on the fly the evaluating the expressing against an example of input message, returning the result in the _Evaluated Output_ field. 

__Note:__ the registered decoders can be used across transfer protocols 

![Integrations HTTP](/images/console_tutorial/integrations_decoder.png?width=60pc)

### Setting up rule with message filter

The final step is to create a __Rule__. In the Rule setup, the user defines the incoming message filter, the outgoing path (if applicable), the transfer protocol that has been setup before and optionally a __Decoder__. 

* `In Rule`: a string relating to the MQTT topic of the _Data Channel_ or the _Control Channel_. It is accepted only if the channel id defined is accessible by user that create the rule! Supports regexes.
    * example with regex: `channels/bc7d700d-7b04-4576-ac52-c281558f9f99/messages/.*`: capture messages from published by any device on the data channel with id: bc7d700d-7b04-4576-ac52-c281558f9f99
    * example: `channels/bc7d700d-7b04-4576-ac52-c281558f9f99/messages/0d129ed0-0109-4ead-97da-43302a758eed`: capture messages published only by device with ID: 0d129ed0-0109-4ead-97da-43302a758eed
* `Out Rule`: (applicable only for MQTT integrations) the MQTT topic of the remote MQTT broker where the message will be published
* `Destination Broker`, `HTTP Hook`: select the previously configured 3rd party system details
* `Decoder`: select the active decoder to be run for each message

When the __Rule__ it is marked as _Active_. Each rule can be paused or started by editing the rule and pressing __Pause__ or __Play__ button.

![Integrations HTTP](/images/console_tutorial/integrations_rules.png?width=60pc)
