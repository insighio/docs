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

Having explained the basic principles, lets see how each protocol is used with the insigh.io platform. 

#### HTTP

#### MQTT

#### CoAP