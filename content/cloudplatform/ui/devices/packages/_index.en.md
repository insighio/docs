---
title: Packages
identifier: "cloudplatform@uioverview@packages"
parent: "uioverview"
weight: 300
---

The console.insigh.io platform, when combined with the [insigh.io firmware](https://github.com/insighio/insighioNode) offers a built-in mechanism for Over-The-Air updates. OTA updates are particularly useful to remotely update a deployed device's firmware to extend its functionality and keep it up-to-date with the latest version.

The implemented mechanism is a secure file sharing approach that gives users full transparency on the status of the procedure.

### Generic Operation of OTA in console.insigh.io

To begin with, let's consider having a compressed **.tar.gz** file that contains the OTA data, which is needed to be transferred to the device as soon as possible. _The contents of the file will be described at the end of this article with an example for how insigh.io firmware handles OTA updates._

Navigate to **Devices** -> **Packages** and create a new Package by providing its name, description info, tags and the file to be shared.

> 🔐 Project viewers are not allowed to create packages. The relevant button is hidden.

![OTA register](/images/console_tutorial/ota_register.png?width=60pc)

Upon successful creation, the package, is ready to be assigned to the device through the **[Device Info]({{< relref"../deviceInfo/" >}})** view, or through batch operation in **[Device List]({{< relref"../deviceList/" >}})**.

By requesting an OTA for one or more devices through the [OTA widget]({{< relref"../deviceInfo/#ota-update" >}}), the following internal procedure occurs:

1. A retained MQTT message is published on the **Control Channel** in subtopic **ota** :
   - **topic example**: `channels/<control-channel-id>/messages/<device-id>/ota`
   - **message example**: `[{"n":"e","v":0},{"n":"i","vs":"fa8884d2"},{"n":"t","vs":".tar.gz"},{"n":"s","v":3987}]`
     - an event type of "pending"
     - the file id to be retrieved
     - the file type extension
     - the file size
1. The device, during its run, will subscribe to the control channel. Since the message is retained, the message will be delivered to the device immediately after its subscription.
1. The device is responsible to execute checks for available space etc. based one the data received.
1. The device downloads the package over HTTPS using **device ID/Key**, **Control Channel ID**, and the **File ID** received from the OTA request. The device ID/Key are validated with **Channel ID** to authorize access to the file.
   - HTTPS request: `https://console.insigh.io/mf-rproxy/packages/download?fuid=<file-id>&did=<device-id>&dk=<device-key>&cid=<control-channel-id>`
   - example using the device details from **[Device Creation]({{< relref "../deviceCreation" >}})** with ID: `06c80d38-07a0-4f3a-87ed-ee17232cd7e7`, Key: `6bb7163b-6edd-42b3-8546-c76693bc2f18`, Control Channel: `6979beea-6c10-4ab2-a684-11989451d7e6`
     ```
     https://console.insigh.io/mf-rproxy/packages/download?fuid=fa8884d2&did=06c80d38-07a0-4f3a-87ed-ee17232cd7e7&dk=6bb7163b-6edd-42b3-8546-c76693bc2f18&cid=6979beea-6c10-4ab2-a684-11989451d7e6
     ```
1. The package is downloaded, is applied and then the device is responsible to report back the installation status by following the procedure:
   1. clear the retain message from the aforementioned topic
   1. publish a non-retained message to the same topic which will contain:
      - **e**: an event id named with value
        - **1** if the OTA has been applied successfully
        - **2** if the OTA has failed
      - **i**: the file id
      - **m**: an optional message. mainly using when OTA fails to state the reason of failure.
      - example:
        - successful: `[{"n":"e","v":1},{"n":"i","vs":"fa8884d2"}]`
        - failed: `[{"n":"e","v":2},{"n":"i","vs":"fa8884d2"},{"m":"i","vs":"not enough space"}]`

### How to create OTA package for devices running insigh.io firmware

[insigh.io firmware](https://github.com/insighio/insighioNode) is based on micropython. So, the firmware is composed with the micropython subsystem combined with the .py files of each project that are uploaded in the device's flash (path: "/").

In 99% of the cases, the micropython subsystem remains the same and the only fixes/upgrades that take place relate with the .py project files. For this reason, the OTA packages that are currently in use are .tar files that pack the files to be transferred into one file. The firmware is able to handle the .tar files by extracting the files in the corresponding folders, reporting the OTA status back to the console.insigh.io and resets to start running with the updated changes.

To automate the OTA package creation, insigh.io provides a tool that handles the TAR file creation, file filtering and Python file minification. The tool is **[microfreezer](https://github.com/insighio/microfreezer)** and it is used internally by insigh.io to both generate OTA packages and to prepare the firmware binaries provided in the releases of [insighioNode project](https://github.com/insighio/insighioNode).

As an example, consider having checked out the insighioNode firmware in folder "_~/projects/insighioNode_". All files/folders from path _~/projects/insighioNode/insighioNode/_ are copied as is in the device root flash folder "/". From this project 2 files have changed with the desired fixes:

- _~/projects/insighioNode/insighioNode/apps/demo_console/demo_scenario.py_
- _~/projects/insighioNode/insighioNode/apps/demo_console/demo_utils.py_

So, it is required to send the above 2 files to the device. The important part here is to keep the folder structure. Follows the commands on how to copy files and generate the OTA package:

```bash
mkdir -p /tmp/otaPackage/src/apps/demo_console
mkdir -p /tmp/otaPackage/firmware

cp ~/projects/insighioNode/insighioNode/apps/demo_console/demo_scenario.py /tmp/otaPackage/src/apps/demo_console/demo_scenario.py
cp ~/projects/insighioNode/insighioNode/apps/demo_console/demo_utils.py /tmp/otaPackage/src/apps/demo_console/demo_utils.py

# assuming microfreezer is checked out in the following path
cd ~/projects/microfreezer
# check config.json for desired config. recommended:
# {
#   "excludeList": [
#              "README",
#              "README.md",
#              "LICENSE",
#              ".git",
#              ".gitmodules",
#              "examples",
#              "local_demos"],
#   "directoriesKeptInFrozen": [""],
#   "enableZlibCompression": false,
#   "targetESP32": true,
#   "targetPycom": false,
#   "minify": true
# }

python3 microfreezer.py --ota-package /tmp/otaPackage/src/apps/demo_console /tmp/otaPackage/firmware
```

Upon successful completion, the OTA package has been generated in path **/tmp/otaPackage/firmware** and is ready to be updated and registered to the **Packages** page of console.insigh.io.
