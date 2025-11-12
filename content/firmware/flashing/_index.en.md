---
title: Firmware Flashing
identifier: "firmware@flashing"
parent: "firmware"
weight: 1005
---

In this guide, you will find information on how to flash the firmware to the main board in Windows & Linux environments.

## Get the files

Download the [latest release binary](https://github.com/insighio/insighioNode/releases). The archive is at compressed form (_tar.gz_) and can be found under the release **assets**. The file name is:
- insighio-**\<release-version\>**-**\<commit-hash\>**-mpy-**\<base-micropython-version\>**-**\<target-esp32-arch\>**-**\<board-version\>**.tar.gz
- example: _insighio-v3.1.1-a92d9f9-mpy-1.19-esp32s3_8mb_with_data_partition_.tar.gz

{{% notice note %}}
In each release there are multiple builds in order to support different ESP32 variants. Unless you have a special version of the main board, you should choose the **esp32s3_8mb_with_data_partition** variant. 
{{% /notice %}}

{{% notice warning %}}
There might be **releases with no assets** at all. These are intermediate versions, so we recommend to work with a version that has built assets.
{{% /notice %}}

After downloading the compressed file, extract it locally. The archive includes the required binaries including a flash script.

### esptool dependency

The flash script uses [esptool](https://github.com/espressif/esptool) to download the binaries on the board, so before proceeding make sure **esptool** is installed.

Instructions on how to install **esptool** in all supported platforms can be found here:
- [Official documentation](https://docs.espressif.com/projects/esptool/en/latest/esp32/)
- [Useful tutorial](https://randomnerdtutorials.com/flashing-micropython-firmware-esptool-py-esp32-esp8266/)

{{< tabs >}}
{{% tab name="Windows" %}}
**Option 1:** Since _esptool_ is a python project, you should have _Python_ installed in the machine. If not, you can [download](https://www.python.org/downloads/windows/) the installer and during installation tick the _ADD TO PATH_ option. You might also need to install the _pyserial_ library afterwards using the command ```pip install pyserial```. To confirm python is properly installed, run ```python --version``` in a prompt/shell.

**Option 2:** Another option is to download the executable file `esptool.exe` and copy it into the extracted release folder. This is available in the [Official Project Releases Page](https://github.com/espressif/esptool/releases) for all platforms. For example for **esptool version 4.10.0** go to [link](https://github.com/espressif/esptool/releases/download/v4.10.0/esptool-v4.10.0-windows-amd64.zip). Then, you need to edit the ```flash.bat``` file and replace ```.\esptool.py``` with ```.\esptool.exe```.

{{% /tab %}}
{{% tab name="Linux" %}}
Follow the instructions from the [Official documentation](https://docs.espressif.com/projects/esptool/en/latest/esp32/).
{{% /tab %}}
{{< /tabs >}}



## Installation

#### 1. Power Off
If powered on, power it off for ~10 seconds.

#### 2. PC connection
Connect insigh.io board to PC

* via the Board Serial Port using a USB-to-Serial Adapter
      ![TAT image](/images/device-uart-to-pc.png?width=40pc)

* via the Board USB Port using a Micro-USB Cable
      ![TAT image](/images/device-uart-to-pc-usb.png?width=40pc)

#### 3. Enter Download Mode

* Turn switch to "**on**", _hold_ "**boot**" button and _click_ "**reset**" button. Ready to flash the binary.
* **Alternative method:** _hold_ "**boot**" button and then turn switch to "**on**" (or press external power button)
   ![TAT image](/images/device-download-mode.png?width=30pc)

{{% notice note %}}
To confirm that the device is in the flash (**download**) mode you can open a Serial Monitor before power on. You can use _Putty_ in Windows or _Minicom_ in Linux, setting baud rate 115200 and the proper Port. After following the previous procedure, you should see in the Monitor the **"waiting for download"** message. Don't forget to **close the monitor** before flashing the binarier.
{{% /notice %}}


#### 4. Flash

{{< tabs >}}
{{% tab name="Windows" %}}
* Find the Port Number from the Device Manager in Windows (e.g. COM5)
* Launch a Command Prompt/Power Shell in the folder where the binary has been extracted
* Run ``flash.bat`` using as extra argument the specific COM Port as follows:
```
flash.bat COM5
```

   {{% /tab %}}
{{% tab name="Linux" %}}
 Execute the flash script included in the archive.

   ```bash
       bash flash.sh /dev/ttyUSB0 # via USB-to-Serial
       #   or
       bash flash.sh /dev/ttyACM0 # via Micro-USB
   ```
{{% /tab %}}
{{< /tabs >}}

After a successful installation you should see an output like this in the prompt:

![TAT image](/images/device-firmware-flash.png?width=30pc)


{{% notice warning %}}
**Note:** By default ```flash.bat``` (in Windows) and ```flash.sh``` (in Linux) make a clean installation, erasing the micro-controller memory before installing the files. If you have flashed another firmware version before and you need to keep the configuration, just edit the ```flash``` files with a typical Editor and remove the fist line which forces memory erase.
{{% /notice %}}


#### 5. Initialization

_Click_ "**reset**" button once and wait till the initialization finishes. This will take up to a minute, since the setup files are in a special form called "__frozen modules__" and need to "unfreeze" before usage.

When ready the device will light up the RGB led.
   - On first boot, it will directly enter [configuration mode] and the RGB led will have a blinking magenta color.
   - If the device is already configured, it will continue the normal execution circle, with the RGB led becoming steady blue initially.
