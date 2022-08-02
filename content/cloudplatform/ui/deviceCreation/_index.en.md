---
title: Device Creation
identifier: "cloudplatform@uioverview@devicecreation"
parent: "uioverview"
weight: 5100
---

The first step of this tutorial is to create one device which will be used throughout the rest of the topics that follow.

Navigate to: __Devices__ -> __Device List__ and hit the `+` button at the __Page Toolbar__ (upper right corner) to open the __Device Creation Form__. 

![Device Creation Request](/images/console_tutorial/device_creation.png?width=60pc)

#### Device Creation Form

The Device Creation Form will be shown to fill in the details of the devices. Through the form, the user can set:
* `Name`: __mandatory:__ the device's human readable name
* `Metadata`: _optional:_ data expressed as JSON that relate to the device to be created. These data will be assigned to the device and be later on accessible. The default value is an empty JSON `{}`

![Device Creation Form](/images/console_tutorial/device_creation_form.png?width=60pc)

In our example, lets name the device __agri-unit-1__ with a minimal JSON where some business logic IDs have been set.  

![Device Creation Form](/images/console_tutorial/device_creation_form_filled.png?width=60pc)

Hit the `Create` button and a confirmation message will be shown. 

![Device Creation Form](/images/console_tutorial/device_creation_form_completed.png?width=60pc)

The device is now listed in the Device List. By clicking on it, opens the __Device Info__ view.