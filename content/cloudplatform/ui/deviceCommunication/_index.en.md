---
title: Device Communication
identifier: "cloudplatform@uioverview@devicecommunication"
parent: "uioverview"
weight: 5200
---

In the previous articles, we have described how to create a device, access its info and its live data. During the demo on how to send data, the quick commands have been used. In this article, the format of those commands will be explained, along with alternative options.

insigh.io platform supports multi-protocol message retrieval over:
* HTTP
* MQTT
* CoAP

All protocols follow some common principles on:
* the authentication
* the formatting of the command
* the message content format

In the [Device Info]({{< relref "../deviceInfo/_index.en.md" >}}) view, there are 4 _Communication Values_. The Device ID/Key which will be used to specify the device that is uploading the data and the Key as the authentication method. Follows the _Data Channel ID_ and the _Control Channel ID_ which are specific data channels created for the User. The _Data Channel_ is used to accept the device measurement uploads. On the other hand, _Control Channel_ is used to __bidirectionaly__ exchange control messages between devices and platform, such as OTA requests, Remote Configuration requests, device statistics upload, etc. 

For the authentication, the ID/Key is combined with the channel id to specifically check device access to the specific data stream.

Regarding the message format, even though any message format can be passed to the platform, only if it is formatted as [SenML message](https://datatracker.ietf.org/doc/html/draft-ietf-core-senml-08) will it be processed by the various tools of the platform.

The advantages of SenML message format it that it formalizes how to provide device ID, multiple measurements with values and message timestamps.

Example message: 
`[{"n":"board_humidity","u":"%RH","bn":"aa00bb11ccdd-","v":27.96, "dt":1659612813},{"n":"board_temp","u":"Cel","v":33.74}]`

which expands to: 
* _device mac_: __aa00bb11ccdd__
* _measurement epoch timestamp_: __1659612813__
* _board_humidity_: __27.96 %RH__
* _board_temp_: __33.74 Celsius__

Having explained the basic principles, lets see how each protocol is used with the insigh.io platform. 

#### HTTP

Send message over HTTP protocol (POST method): 

Requires: `device_id`, `device_key`, `data_channel_id`

```bash
curl -s -S -i -X POST -H "Content-Type: application/json" -H "Authorization: <device_key>" http://console.insigh.io/http/channels/<data_channel_id>/messages/<device_id> -d '[{"n":"board_humidity","u":"%RH","bn":"aa00bb11ccdd-","v":27.96, "dt":1659612813},{"n":"board_temp","u":"Cel","v":33.74}]'
```

For HTTPS, devices can use it directly, though curl requires the public certificate to be explicitly defined. Download it from [here](/files/console-insighio.crt) and run the following command:

```bash
curl -s -S -i --cacert ./console-insighio.crt -X POST -H "Content-Type: application/json" -H "Authorization: <device_key>" https://console.insigh.io/http/channels/<data_channel_id>/messages/<device_id> -d '[{"n":"board_humidity","u":"%RH","bn":"aa00bb11ccdd-","v":27.96, "dt":1659612813},{"n":"board_temp","u":"Cel","v":33.74}]'
```

#### MQTT

The examples utilize [mosquitto MQTT client](https://mosquitto.org/download/)

##### Send

Send message over MQTT protocol (Publish):

Requires: `device_id`, `device_key`, `data_channel_id`

```bash
mosquitto_pub -u <thing_id> -P <thing_key> -t channels/<data_channel_id>/messages/<device_id> -h console.insigh.io -m '[{"n":"board_humidity","u":"%RH","bn":"aa00bb11ccdd-","v":27.96, "dt":1659612813},{"n":"board_temp","u":"Cel","v":33.74}]'
```

##### Listen

Listen for messages over MQTT protocol (Subscribe):

Requires: `device_id`, `device_key`, `data_channel_id`

```bash
mosquitto_sub -u <thing_id> -P <thing_key> -t channels/<data_channel_id>/messages/<device_id> -h console.insigh.io -v
```

#### CoAP

Send messages over CoAP protocol (POST) to the URL: 

Requires: `device_id`, `device_key`, `data_channel_id`

```bash
coap://console.insigh.io/channels/<data_channel_id>/messages/<device_id>?auth=<device_key>
```