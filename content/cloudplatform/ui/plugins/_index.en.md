---
title: Plugins
identifier: "cloudplatform@uioverview@plugins"
parent: "uioverview"
weight: 5500
---

The plugins service offers the opposite functionality of the integrations service. While with integrations users can forward incoming data to third-party platforms, with plugins users can acquire data from third-party platforms. This is particularly useful in non-IP-based communications, like Satellite IoT or LoRaWAN (e.g., TheThings Network), where the messages are sent to other platforms. However, the functionality can also be used with any third-party platform that provides an API to collect the data.

Three different protocols are currently supported in the plugins service:

1. **MQTT**, where a MQTT client is subscribed to the broker that the user defines and listens for incoming messages.
2. **HTTP**, which supports two ways to collect the data:
   - Receive, which listens for incoming data
   - Poll, which requests data from the third-party platforms in a predefined interval
3. **FTP**, where a FTP client polls a FTP server for files that satisfy predefined criteria

The basic principle of the plugins service is that the user defines a plugin for a third-party platform and a number of devices that use that plugin to acquire data from that platform. Each device must be configured to use that plugin during the device creation or can be updated later on. Each device needs to be mapped to an "External Device ID", which is the device's ID on the third-party platform. An example of a device configuration is shown in the following sections.

The basic flow of an end-to-end communication for a plugin scenario is the following:

1. The device on the field sends a message using the configured communication technology (e.g., Satellite IoT, LoRaWAN or a file on an FTP server).
2. The plugins service acquires the data from the third-party platform in the form of a payload. The payload contains the message (i.e., the measurements) along with metadata provided by the third-party platform. The most important part of the metadata is the device ID, which is provided by the third-party platform for that specific device. This ID has different names on each platform (e.g., "Device GUID" on Astrocast, "DevEUI" on TheThings) and it is called generically "External Device ID" on the insigh.io platform.
3. The plugins service uses the predefined decoder to extract the "External Device ID" and the message itself from the payload.
4. The service maps the External Device ID to a device on the insigh.io platform and stores the message for that device.

{{% notice note %}}
Project viewers cannot create plugin rules, brokers, servers and/or decoders. Also, project editors cannot delete already created plugins entities. The relevant buttons are disabled.
{{% /notice %}}

### Decoders

Regardless of the selected communication protocol, each plugin needs to use a predefined decoder for the incoming messages. The role of the decoder is to parse the incoming message and transform it to the appropriate (i.e., SenML) format for the Console. The decoder can also transform the message contents if required. It is a JavaScript function that receives as input the payload and returns an object with two key-value pairs: the device id and the message in the SenML format, which is the supported format for the insigh.io platform. There are several predefined decoders that cover common scenarios:

- **The Things** decoder supports LoRaWAN scenarios on TheThings Network
- **ChirpStack** decoder supports LoRaWAN scenarios on the ChirpStack network server
- **Astrocast** decoder supports Satellite IoT scenarios using Astrocast's constellation
- **Sensoneo** decoder supports decoding data from the Sensoneo platform
- **ADCON** decoder supports decoding data files from an FTP server, containing data in the ADCON format
- **Elsys** decoder supports Elsys devices
- **Milesight-EM300** and **Milesight-WT201** decoders support Milesight devices
- **BMeters Hydrodigit** decoder supports the relevant BMeters device

![Plugins Decoders](/images/console_tutorial/plugins_all_decoders.png?width=60pc)

For other scenarios, users can define a custom decoder:

![Plugins Decoders](/images/console_tutorial/plugins_custom_decoder.png?width=60pc)

The user interface allows users to edit the code and also test it by providing the expected input. If the evaluated output is the expected one, proceed with saving the decoder.

{{% notice tip %}}
Decoders can be reused across multiple plugin rules, even for different rule types.
{{% /notice %}}

#### MQTT

When defining an MQTT plugin, the service creates a MQTT client that subscribes to the configured broker and topic and listens for new messages. The plugin needs to use a decoder, as described previously and a broker, which is the broker to which the service will subscribe to listen for incoming messages. Users need to define the following information for the broker:

- MQTT broker URL
- MQTT broker Port
- Username (optional)
- Password (optional)

![Plugins MQTT](/images/console_tutorial/plugins_mqtt_broker.png?width=60pc)

Then, the MQTT Rule can be created. The rule needs to have a name, a MQTT broker, a decoder and a topic to which the client will be subscribed:

![Plugins MQTT](/images/console_tutorial/plugins_mqtt_rule.png?width=60pc)

{{% notice tip %}}
MQTT plugins are particularly useful in LoRa scenarios, where the devices typically send data to a LoRa server via MQTT.
{{% /notice %}}

#### HTTP

HTTP plugins support two ways to acquire device data, **Receive** and **Poll**.

##### HTTP Receive

This method is used when the third-party platforms support webhooks and can be configured to forward the data for a device to another platform via HTTP POST requests. An example of this scenario is Astrocast, where you can configure callbacks for a particular device. In this scenario, the plugins service listens to incoming HTTP POST requests at the predefined /api/v1/plugins endpoint. The only configuration required for a user is the message decoder. When the plugin is created, an Authentication Token is automatically created. This token must be provided in the HTTP POST message headers as "Authorization: < token >". This needs to be configured on the third-party platform of course.

![Plugins HTTP Receive](/images/console_tutorial/plugins_http_receive.png?width=60pc)

##### HTTP Poll

This method is used when third-party platforms do not support webhooks, but offer a REST API to poll the data via HTTP POST requests. Currently, only POST requests are supported, but GET requests will soon be supported too.

The basic principle is that we request data from an API every n hours (configurable) using a range field to filter the data. An important configuration for the polling method is that there needs to be a field that we can use so that we can filter the data that we request every time. In the current implementation, only date fields are allowed to filter data. In the future, this could be enhanced so that other types are also supported (e.g., IDs).

For the POST request, the user needs to specify:

- The host name
- The endpoint
- The port
- The "range field from" field name
- The "range filter to" field name
- The polling frequency. Currently supported values of n hours (1, 4, 12, 24 hours)
- The message decoder
- Custom HTTP headers required by the third-party API (e.g., authorization)
- Custom body options required by the third-party API

![Plugins HTTP Poll](/images/console_tutorial/plugins_http_poll.png?width=60pc)

#### FTP

The FTP plugin rules offer the option to acquire data from FTP servers. When creating a FTP plugin rule, the service polls the FTP server for files that satisfy the rule's predefined criteria. The decoders used in the FTP plugins differ from the other plugin types because they operate on the file level and not on the message level, since each file may contain multiple measurements in different timestamps.

The FTP decoders accept a JavaScript object with the following properties:

- The file contents as a JavaScript array, where each line is an array element
- The file path, which can be useful in scenarios where the external device id is in the file path and not in the file's contents
- The delimiter, which is a plugin rule configuration and passed in the decoder so that it knows how to separate the fields/columns

After defining an FTP decoder, the user needs to create an FTP server. The required FTP server information is the following:

- The server name (user defined)
- The protocol (FTP or SFTP)
- The host/url, which can be a domain name or an IP address
- The port number
- The username
- The password

To test whether the provided information is correct, there is a "Test Connection" button in the upper right corner of the FTP Server card.

![Plugins FTP Server](/images/console_tutorial/plugins_ftp_server.png?width=60pc)

Finally, to create a new FTP plugin rule, the following information is required:

- The rule name
- The FTP server configuration
- The decoder
- The root path where the service will look for files. The service also supports recursive file discovery, so if there are files that satisfy the criteria in sub-folders under this path, it will acquire the data
- The polling frequency
- The file extension that the service will look for. If no file extension is required, please use "Any"
- The delimiter that is passed to the decoder to separate the fields/columns of the data in the file
- Whether to delete the file after successful processing. If the file is not deleted and not removed by an external process, it will be re-processed in the next poll iteration. Note that if a file that satisfies the rule criteria is not successfully processed, it will be renamed by appending the ".error" suffix in the file's name.

![Plugins FTP Rule](/images/console_tutorial/plugins_ftp_rule.png?width=60pc)

#### Device Configuration

When a plugin is created, it can be used by a device so that incoming data is mapped on a particular device on the insigh.io platform. To configure a device to use a plugin, select "Alternative Data Source" and then select the appropriate plugin.

![Plugins Device Configuration](/images/console_tutorial/device_plugin.png?width=30pc)

Then, the "External Device ID" needs to be provided. As described earlier, this is the ID of the device on the third-party platform and is called differently depending on the platform. For example, it is the Device GUID in Astrocast, the DevEUI on LoRaWAN, etc.

![Plugins Device Configuration](/images/console_tutorial/plugins_external_device_id.png?width=30pc)

Once the device is created, insigh.io will start getting the data for this device using the configured plugin.
