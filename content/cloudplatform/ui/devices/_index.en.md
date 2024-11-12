---
title: Devices
identifier: "cloudplatform@uioverview@devices"
parent: "uioverview"
weight: 5250
---

The Console is an IoT cloud platform that offers device management, monitoring and provisioning functionalities. A Console device is the core entity that represents and actual IoT device on the field. To send measurements to the Console, the user needs to create a device, which will generate the security keys that are required for device authentication and authorization.

Using insigh.io's Console, users can:

1. Create and provision devices
1. Perform remote configuration
1. Perform over-the-air (OTA) updates
1. Send commands to the device
1. Monitor device status

## Third-party devices

Although by using insigh.io's IoT hardware users can enjoy the full feature set of the Console, in many cases there are already available third-party devices that may satisfy the needs of a particular use case. Supporting well-established IoT communication protocols and best practices, the Console is a flexible platform that is not restricted to insigh.io-built devices, but also supports third-party devices. There are two main ways to integrate third-party devices to the Console:

1. Using the [_Plugins_](/cloudplatform/ui/plugins/) service
1. Updating the device's firmware to adhere to the Console API

The second approach is an obvious one, but also the least common in real-world scenarios. The [Console API](/cloudplatform/api) is publicly available and documented, but even if users have access to the device firmware, it would be time-consuming and require effort to tweak the device firmware to use the Console API.

However, the first approach is quite straightforward and common. The _Plugins_ service enables users to acquire data from third-party platforms for a particular device and import it to the Console. There are two typical scenarios:

1. LoRa-enabled third-party devices communicate with a LoRa server (e.g., TheThings, ChirpStack, etc.). Using the _Plugins_ service, users can acquire the data in real time from the LoRa server and import it to the Console.
1. If the device does not use LoRa, but communicates with a third-party platform, the _Plugins_ service may also be able to communicate with the platform and acquire the data.

The next section shows how a new device is created in the Console.
