---
title: Platform Setup
identifier: "platform-setup@gettingstarted"
parent: "gettingstarted"
weight: 120
---

After setting up the hardware and right before configuration, we need to onboard the node to the platform. In essence, onboarding creates the "digital twin" of the physical device, using a unique set of keys. With onboarding completed, the node will be ready to read data from the connected sensors and upload them to the platform upon power-on.

Node onboarding includes the following steps:
- First time users **create an account** into [Console](https://console.insigh.io).
- **Create a device** into the platform
- Get the unique device access **keys** for device provisioning.

### Step-by-step procedure


#### Create Account

1. Go to [insigh.io console registration page](https://console.insigh.io/register)
1. Sign up by entering an email and a password.
1. Verify your email address by following the link in the email message that has been sent to you.
1. Ready to login!

![console registration](/images/gettingstarted/console-registration.png?width=40pc)


{{% notice tip %}}
Even if another Console user has sent an invitation to join an existing project, the creation of the user account is mandatory.
{{% /notice %}}

{{% notice info %}}
First time users are by default associated with their first project, called "personal". Then, they can create and switch to new projects.
{{% /notice %}}


#### Create Device

These steps will create a device assigned to the account and ready to receive data.

1. After Login, go to [Device List](https://console.insigh.io/devices/list) view.
1. Press the **+** button at the upper middle of the screen.
1. In the dialog that appears, enter at least distinct name for the device (ex. demo-device) and press **Create** (all other fields are optional).

![console create device](/images/gettingstarted/console-create-device.png?width=40pc)

#### Get Access Keys for Provisioning Device

Upon new device creation, the [**Device Info**]({{< relref "../../cloudplatform/ui/devices/deviceinfo/" >}}) view opens automatically. 
1. Move to **More Details ["..."]** icon and click to load additional device information.
1. Click on the icon next to **JSON** to copy full access information (**ID, Key, Control Channel, Data Channel**) in JSON format. Keep this JSON as it will be used in the upcoming [**Configure Node**]({{< relref "./configure_node.md" >}}) procedure. Have the page open for validating data upload in the final [**Validate**]({{< relref "./validate" >}}) step.

![console device keys](/images/gettingstarted/console-device-keys.png?width=40pc)

### Final Remark
The "digital twin" of the physical device has been created, and we are ready to move to the node configuration. 