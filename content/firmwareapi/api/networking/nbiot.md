---
title: nbiot
#pre: "<b>2. </b>"
identifier: "firmwareapi@api@networking@nbiot"
parent: "firmwareapi@api@networking"
weight: 1220
---

`nbiot` module handles the connection procedure through AT commands to a NBIoT network, sends data and handles disconnection.

```
from networking import nbiot
```

### Functions

**nbiot.connect(cfg, dataStateOn=True)**

Connect to an NBIoT network based on provided configuration object.

- params
  - `cfg`: an object containing the following configuration options:
    - `cfg._IP_VERSION`: String value that defines the IP version of the connection.
      - `IP`
      - `IPV6`
      - `IPV4V6`
    - `cfg._APN`: The APN to be used for the connection
    - `cfg._MAX_ATTACHMENT_ATTEMPT_TIME_SEC`: Integer, the timeout in seconds for the data attachment
    - `cfg._MAX_CONNECTION_ATTEMPT_TIME_SEC`: Integer, the timeout in seconds fro the data connection. Applicable only if `dataStateOn` is True.
  - `dataStateOn`: Enable/Disable whether to execute data connection after a successful data attachment. If dataStateOn is True, no AT commands can be sent.
- returns:
  - `status`: Integer, the data status of the NBIoT modem. The integer values can be translated into macros:
    - `nbiot.NBIOT_DETTACHED`: -1
    - `nbiot.NBIOT_MODEM_ACTIVATED`: 0
    - `nbiot.NBIOT_ATTACHED`: 1
    - `nbiot.NBIOT_CONNECTED`: 2
  - `activation_duration`: The duration in (ms) between the request to set from Airplane mode to Normal and the confirmation that the modem was activated "_+CFUN: 1_".
  - `attachment_duration`: The duration in (ms) between the successful activation of the modem and the confirmation that the modem has been attached (_LTE.isattached()_).
  - `connection_duration`: if `dataStateOn` is True, the duration in (ms) between the request for modem connection (_LTE.connect()_) and the confirmation that the modem has been connected (_LTE.isconnected()_).
  - `rssi`: The RSSI for the successful link, else -1.
  - `rsrp`: The RSRP for the successful link, else -1.
  - `rsrq`: The RSRQ for the successful link, else -1.

**nbiot.deactivate()**

Actions implemented when turning off LTE modem. This includes LTE disconnection (if connected) followed by LTE deinitialization.

- returns:
  - `deactivation_status`: Boolean, whether disconnection was successful
  - `deactivation_duration`: the duration in (ms) to complete procedure

**nbiot.sendAtCommand(command, max_tries=1)**

Send an AT command to the modem with retries till it is successful. After each failed trial, it will wait for 500ms till it re-sends the command.

- args:
  - `command`: the AT command to send to the modem.
  - `max_retries`: the number of retries in case the command returns a non-OK message. Default is 1.
- returns:
  - `response`: the response from the modem (stripped from starting and ending white spaces)
  - `status`: boolean: whether the command returned an OK message.

**nbiot.sendATsocket(data, host, port)**

Send data over UDP using AT commands instead of the build-in micropython UDP sockets. This is essential if during the connection _IPV6_ has been used as _\_IP_VERSION_ since Pycom modules do not support IPv6 sockets.

{{% notice note %}}
This function uses [microATsocket](https://github.com/insighio/microATsocket) sockets.
{{% /notice %}}

- args:
  - `data`: the data string to transmit.
  - `host`: the IP of the host. No URL resolving for the moment to keep the data consumption low.
  - `port`: the UDP port of the host.
