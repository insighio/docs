---
title: WiFi
identifier: "gettingstarted@configuration@wifi"
parent: "gettingstarted@configuration"
weight: 50
next: "/gettingstarted/configuration/measurements"
---

insigh.io board Web UI configuration scenario for setting up WiFi connection.

1. Open the Web UI URL: [http://192.168.4.1](http://192.168.4.1)
1. login with **username:** _admin_ and **password:** _insighiodev_
1. Select WiFi
1. Network details
    1. Set the SSID _(For convenience, at the bottom of the page there is a list of the 10 strongest signal neighbour SSDIs. By clicking on the name of an SSID in the list, the SSID name gets auto-filled)_
    1. Set the password for the selected SSID
    1. Choose the communication protocol between MQTT (over TCP) and CoAP (over UDP). In case of doubt, keep the default selection (MQTT).
    1. Press "**Save**" button
1. Set the API Keys
    - Use the API keys generated during device creation in [console.insigh.io](https://console.insigh.io/devices/list) to provision the device. The keys can be retrieved by accessing the "Device Info View".
    - Tip Autofill: After completing step "Create Device" keep the tab open in the "Device Info view". Thus, during this step you can go back to the **Device Info View** and:
        - either manually copy/paste the corresponding keys to the fields
        - or press the **Quick device data commands** button and then copy **JSON** data button. Upon pasting these data to any of the fields, the data will be auto-imported to the appropriate fields.
    - Press "**Save**" button

Next step will be to [Enable / disable measurements]({{< relref "../measurements/_index.en.md" >}}) that will be run during the demo scenario.

![wifi setup](/images/webui-wifi.gif?width=50pc)
