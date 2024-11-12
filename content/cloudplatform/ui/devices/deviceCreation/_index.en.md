---
title: Device Creation
identifier: "cloudplatform@uioverview@devices@devicecreation"
parent: "devices"
weight: 100
---

The first step of this tutorial is to create one device which will be used throughout the rest of the topics that follow.

Navigate to: **Devices** -> **Device List** and hit the `+` button at the **Page Toolbar** (upper right corner) to open the **Device Creation Form**.

![Device Creation Request](/images/console_tutorial/device_creation.png?width=60pc)

#### Device Creation Form

The Device Creation Form will be shown to fill in the details of the devices. Through the form, the user can set:

- `Name`: **mandatory:** the device's human readable name
- `Metadata`: _optional:_ data expressed as JSON that relate to the device to be created. These data will be assigned to the device and be later on accessible. The default value is an empty JSON `{}`

![Device Creation Form](/images/console_tutorial/device_creation_form.png?width=60pc)

In our example, lets name the device **agri-unit-1** with a minimal JSON where some business logic IDs have been set.

![Device Creation Form](/images/console_tutorial/device_creation_form_filled.png?width=60pc)

Hit the `Create` button and a confirmation message will be shown.

![Device Creation Form](/images/console_tutorial/device_creation_form_completed.png?width=60pc)

The device is now listed in the Device List. By clicking on it, opens the **Device Info** view.
