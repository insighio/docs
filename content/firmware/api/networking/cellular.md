---
title: cellular
#pre: "<b>2. </b>"
identifier: "firmware@api@networking@cellular"
parent: "firmware@api@networking"
weight: 1230
---

`cellular` module handles modem operations for UART-controlled modems (ex. modems used in [insigh.io cellular board]({{< relref "../../../hardware/custom/insighio-cellular-weigh-scale.md" >}}))

Current support:

- Quectel MC60
- Quectel BG600
- Pycom modem (work in progress)

```
from networking import cellular
```

### Functions

**cellular.set_pins(power_on=None, power_key=None, modem_tx=None, modem_rx=None, gps_tx=None, gps_rx=None)**

Set the Pin numbers for all required controls and UARTs that connect the modem module on the host device (ex. ESP32).

- params
  - `power_on`: Pin number that controls the power supply of the modem
  - `power_key`: Pin number that powers on/off the modem
  - `modem_tx`: Pin number of the modem's UART TX
  - `modem_rx`: Pin number of the modem's UART RX
  - `gps_tx`: Pin number of the modem's GPS UART TX
  - `gps_rx`: Pin number of the modem's GPS UART RX

**cellular.get_modem_instance()**

After setting the communication Pins with **cellular.set_pins**, **cellular.get_modem_instance** will auto-detect the connected modem (if any), will auto-power it on if needed and return a Modem instance though which low-level operations of the modem can be executed. The Modem instance returned is singleton thus any subsequent calls to this function will directly return the same Modem instance.

- returns:
  - `modem_instance`: A Modem instance of the detected modem. If no modem is detected, `None` will be returned

**cellular.connect(cfg, dataStateOn=True)**

Complete cellular connection procedure (activation, attachment, data connection)

- params
  - `cfg`: an object containing the following configuration options:
    - `cfg._IP_VERSION`: String value that defines the IP version of the connection.
      - `IP`
      - `IPV6`
      - `IPV4V6`
    - `cfg._APN`: The APN to be used for the connection
    - `cfg._CELLULAR_TECHNOLOGY`: A string representing the desired technology to use. If the technology is not recognized or un-supported by the modem, the modem will automatically choose the technology. Valid Values:
      - `GSM`
      - `NBIoT`
      - `AUTO`
    - `cfg._MAX_ATTACHMENT_ATTEMPT_TIME_SEC`: Integer, the timeout in seconds for the data attachment
    - `cfg._MAX_CONNECTION_ATTEMPT_TIME_SEC`: Integer, the timeout in seconds for the data connection. Applicable only if `dataStateOn` is True.
  - `dataStateOn`: Enable/Disable whether to execute data connection after a successful data attachment. If dataStateOn is True, no AT commands can be sent.
- returns:
  - `status`: Integer, the data status of the NBIoT modem. The integer values can be translated into macros:
    - `cellular.MODEM_DETTACHED`: -1
    - `cellular.MODEM_MODEM_ACTIVATED`: 0
    - `cellular.MODEM_ATTACHED`: 1
    - `cellular.MODEM_CONNECTED`: 2
  - `activation_duration`: The duration in (ms) between the request to set from Airplane mode to Normal and the confirmation that the modem has successfully registered "_+CREG: 2_" or "_+CREG: 5_".
  - `attachment_duration`: The duration in (ms) between the successful activation of the modem and the confirmation that the modem has been attached (_AT+CGATT=1_).
  - `connection_duration`: if `dataStateOn` is True, the duration in (ms) between the request for modem connection (_Modem.connect()_) and the confirmation that the modem has been connected (_Modem.is_connected()_).
  - `rssi`: The RSSI for the successful link, else -1.
  - `rsrp`: The RSRP for the successful link, else -1.
  - `rsrq`: The RSRQ for the successful link, else -1.

**cellular.update_rtc_from_network_time(modem)**

Having a Modem instance already, this function will request modem's network time and/or GPS time and update RTC. The result of the function can be checked by comparing the RTC time before and after the call. In case of any error, the RTC is not updated.

```
modem = cellular.get_modem_instance()
logging.debug("Time before RTC update: {}".format(RTC().datetime()))
cellular.update_rtc_from_network_time(modem)
logging.debug("Time after RTC update: {}".format(RTC().datetime()))

```

**cellular.deactivate()**

**deactivate** will get the detected modem, disconnect it from the network and power it off.

- returns
  - `deactivation_status`: boolean, the operation status
  - `deactivattion_duration:` integer, the operation's duration in (ms)
