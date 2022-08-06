---
title: Packages
identifier: "cloudplatform@uioverview@packages"
parent: "uioverview"
weight: 5350
---

The console.insigh.io platform, when combined with the [insigh.io firmware](https://github.com/insighio/insighioNode) offers a build-in mechanism for Over-The-Air updates.

The implemented mechanism is a secure file sharing combined with status reports on procedure status. 

### Generic Operation of OTA in console.insigh.io

To begin with, let's consider having a file __OTA.tar.gz__ that contains the OTA data, which is needed to be transferred to the device as soon as possible. _The contents of the file will be described at the end of this article with an example for how insigh.io firmware handles OTA udpates._

Navigate to __Devices__ -> __Packages__ and create a new Package by providing its name, description info, tags and the file to be shared. 

![OTA register](/images/console_tutorial/ota_register.png?width=60pc)

Upon successful creation, the package, is ready to be assigned to the device through the __[Device Info]({{< relref"../deviceInfo/" >}})__ view, or through batch operation in __[Device List]({{< relref"../deviceList/" >}})__.

By requesting an OTA for one or more devices through the [OTA widget]({{< relref"../deviceInfo/#ota-update" >}}), the following internal procedure occurs: 
1. A retained MQTT message is published on the __Control Channel__ in subtopic __ota__ : 
    * __topic example__: `channels/1422987b-930b-4fc3-a185-6cdff6f855ac/messages/eb39752e-99ca-4028-add9-23ec63d4d3ef/ota`
    * __message example__: `[{"n":"e","v":0},{"n":"i","vs":"7985d8c2"},{"n":"t","vs":".tar.gz"},{"n":"s","v":3987}]`
        * an event type of "pending"
        * the file id to be retrieved
        * the file type extension
        * the file size
1. The device, during its run, will subscribe to the control channel. Since the message is retained, the message will be delivered to the device immediately after its subscription. 
1. The device is responsible to execute checks for available space etc. based one the data received.
1. The device downloads the package over HTTPS using __device ID/Key__, __Control Channel ID__, and the __File ID__ received from the OTA request. The device ID/Key are validated with __Channel ID__ to confirm the legitimate access to the file.
    * HTTPS request: `https://console.insigh.io/mf-rproxy/packages/download?fuid=<file-id>&did=<device-id>&dk=<device-key>&cid=<control-channel-id>`
    * example using the device details from __[Device Creation]({{< relref "../deviceCreation" >}})__ with ID: `0d129ed0-0109-4ead-97da-43302a758eed`, Key: `e9e8350e-953b-460a-bbbc-84fcc7c07608`, Control Channel: `3573ea18-7c79-4748-92b6-69776a5ed20f`
        ```
        https://console.insigh.io/mf-rproxy/packages/download?fuid=7985d8c2&did=0d129ed0-0109-4ead-97da-43302a758eed&dk=e9e8350e-953b-460a-bbbc-84fcc7c07608&cid=3573ea18-7c79-4748-92b6-69776a5ed20f
        ```
1. The package is downloaded, is applied and then the device is responsible to report back the installation status by following the procedure:
    1. clear the retain message from the aforementioned topic
    1. publish a non-retained message to the same topic which will contain:
        * __e__: an event id named with value
            * __1__ if the OTA has been applied successfully
            * __2__ if the OTA has failed
        * __i__: the file id
        * __m__: an optional message. mainly using when OTA fails to state the reason of failure.
        * example: 
            * successful: `[{"n":"e","v":1},{"n":"i","vs":"7985d8c2"}]`
            * failed: `[{"n":"e","v":2},{"n":"i","vs":"7985d8c2"},{"m":"i","vs":"not enough space"}]`

