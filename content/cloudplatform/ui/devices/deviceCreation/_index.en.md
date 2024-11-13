---
title: Device Creation
identifier: "cloudplatform@uioverview@devices@devicecreation"
parent: "devices"
weight: 100
---

The first step to create a device that will be used throughout the rest of the tutorial.

Navigate to: **Devices** -> **Device List** and hit the `+` button at the **Page Toolbar** (upper right corner) to open the **Device Creation Form**.

![Device Creation Request](/images/console_tutorial/device_creation.jpg?width=60pc)

#### Device Creation Form

The Device Creation Form will be shown to fill in the details of the devices. Through the form, the user can set:

- `Name`: **mandatory:** the device's human readable name
- `Bootstrap`: _optional:_ If enabled, the device will acquire the communication keys with the _Bootstrap_ procedure
- `Location`: _optional:_ If specified, the device is associated with a predefined location
- `Alternative Data Source`: _optional:_ If specified, the device is associated with a [Plugin](/cloudplatform/ui/plugins) service
- `Metadata`: _optional:_ By clicking on the Advanced option, users can set the device's metadata. The metadata is stored in a JSON format, it will be assigned to the device and be later on accessible. The default value is an empty JSON `{}`

![Device Creation Form](/images/console_tutorial/device_creation_form.jpg?width=60pc)

In our example, lets name the device **agri-unit-1** with a minimal JSON where some business logic IDs have been set.

![Device Creation Form](/images/console_tutorial/device_creation_form_filled.jpg?width=60pc)

Hit the `Create` button and a confirmation message will be shown.

![Device Creation Form](/images/console_tutorial/device_creation_form_completed.jpg?width=60pc)

The device is now listed in the Device List. By clicking on it, opens the **Device Info** view.
