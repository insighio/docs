---
title: Configure Device
weight: 20
---

## Configure Device

By completing the previous step, a device has been created and provisioned in the platform. In this step, using the generated security keys, the physical device will be configured to start running the demo code and periodically upload measurements. To do so, we will connect to the device via WiFi, open then guided Web UI and apply our configuration.

The key configurations that will be edited are:

- Network type selection (WiFi, NBIoT, LoRa)
- Selected network parameters
- Communication protocol
- Measurement period duration
- Security Keys

#### How to enable WiFi Access Point mode

The Web UI of insigh.io board is accessible only after a **hard reset** (power off/on). During this procedure, the board becomes a WiFi Access Point and waits for connections.

Each board broadcasts a WiFi **SSID** with format _insigh-<last 4 digits of mac address>_ (ex. _insigh-5fa1_) with **password**: _insighiodev_

#### WiFi Access Point mode indicator

The WiFi Access Point is ready for connection around 5-10 seconds after power on. Its ready state is identified by the LED that turns **purple**.

#### WiFi Access Point mode timeouts

The WiFi Access Point will remain active for:

- **25 seconds**, if no WiFi client gets connected
- **5 minutes**, if any WiFi client gets connected

## How To

1. Power on board with Pycom device.
1. When the LED on the Pycom board turns to purple, the WiFi Access Point is ready to accept connections
1. Connect via WiFi to the broadcasted **SSID** (ex. _insigh-5fa1_) with **password**: _insighiodev_
1. Open the Web UI URL: [http://192.168.4.1](http://192.168.4.1) or [device.local](http://device.local)
1. login with **username:** _admin_ and **password:** _insighiodev_
1. Select Network type for data exchange:
   - [WiFi]({{< relref "wifi/_index.en.md" >}})
   - [NBioT]({{< relref "nbiot/_index.en.md" >}})
   - [LoRA]({{< relref "lora/_index.en.md" >}})
