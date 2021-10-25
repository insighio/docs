---
title: NBIoT
identifier: "gettingstarted@configuration@nbiot"
parent: "gettingstarted@configuration"
weight: 60
---

insigh.io board Web UI configuration scenario for setting up NBioT connection.

1. Open the Web UI URL: [http://192.168.4.1](http://192.168.4.1)
1. login with **username:** _admin_ and **password:** _insighiodev_
1. Select NBIoT
1. Network details
    1. Set the APN _(as provided by the network operator)_
    1. Select the network technology to be used (GSM, NBIoT, auto). If the selected technology is not supported by the modem, auto-selection is enabled.
    1. Set the band of operation _(**applicable only for Pycom devices for now**, default selection is band 20)_
    1. Choose the communication protocol between MQTT (over TCP) and CoAP (over UDP). In case of doubt, keep the default selection (MQTT).
    1. Select between IPv4 and IPv6. (_check with your mobile operator for the supported IP version_)
1. Set the API Keys
    - Use the API keys generated during device creation in [console.insigh.io](https://console.insigh.io/devices/list) to provision the device. The keys can be retrieved by accessing the "Device Info View".
    - Tip Autofill: After completing step "Create Device" keep the tab open in the "Device Info view". Thus, during this step you can go back to the **Device Info View** and:
        - either manually copy/paste the corresponding keys to the fields
        - or press the **Quick device data commands** button and then copy **JSON** data button. Upon pasting these data to any of the fields, the data will be auto-imported to the appropriate fields.

Next step will be to [Enable / disable measurements]({{< relref "../measurements/_index.en.md" >}}) that will be run during the demo scenario.

![nbiot setup](/images/webui-nbiot.gif?width=50pc)
