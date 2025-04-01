---
title: Firmware Flashing Guide
identifier: "firmware@flashing"
parent: "firmware"
weight: 1005
---

Download the [latest release binary](https://github.com/insighio/insighioNode/releases) and extract localy.
The archive can be found in the release assets and its file name is:

- insighio-**\<release-version\>**-**\<commit-hash\>**-**\<board-version\>**.tar.gz
- example: _insighio-v2.2.0-f49e354-esp32s3.tar.gz_

The archive includes the required binaries including a flash script.

## esptool dependency

The flash script uses [esptool](https://github.com/espressif/esptool) to download the binaries on the board, so before proceeding make sure **esptool** is installed.

Instructions on how to install **esptool** in all supported platforms can be found here:

- [Official documentation](https://docs.espressif.com/projects/esptool/en/latest/esp32/)
- [Useful tutorial](https://randomnerdtutorials.com/flashing-micropython-firmware-esptool-py-esp32-esp8266/)

## Installation

1. If powered on, power it off for ~10 seconds.

1. Power on device and boot into download mode

   - turn switch to "**on**", _hold_ "**boot**" button and _click_ "**reset**" button. Ready to download the binary.
   - **alternative method:** _hold_ "**boot**" button and then turn switch to "**on**" (or press external power button)
     ![TAT image](/images/device-download-mode.png?width=30pc)

1. Connect insigh.io board to PC

   1. via USB-to-Serial
      ![TAT image](/images/device-uart-to-pc.png?width=40pc)

   1. via Micro-USB
      ![TAT image](/images/device-uart-to-pc-usb.png?width=40pc)

1. Download binaries by executing the flash script included in the archive.

   ```bash
       bash flash.sh /dev/ttyUSB0 # via USB-to-Serial
       #   or
       bash flash.sh /dev/ttyACM0 # via Micro-USB
   ```

   ![TAT image](/images/device-firmware-flash.png?width=30pc)

1. _Click_ "**reset**" button once and wait till the initialization finishes. When ready the device will light up the RGB led. (see last step of [Getting Started guide]({{< relref "../../gettingstarted/validation/_index.en.md" >}}) for RGB coloring guide)
   - On first boot, it will directly enter [configuration mode]({{< relref "../../gettingstarted/configuration/_index.en.md" >}}).
   - If the device is already configured, it will continue the normal execution circle.
