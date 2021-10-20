---
title: modem
#pre: "<b>2. </b>"
identifier: "firmwareapi@api@networking@modem"
parent: "firmwareapi@api@networking"
weight: 1231
---

`Modem` is a base class for seamless operations on multiple modem types. The easiest way to instantiate it is through `cellular.get_modem_instace()` which will return the corresponding Modem child class:

-   `ModemBG600`: Overloaded Modem class for Quectel BG600 (in module `networking.modem.modem_bg600`)
-   `ModemMC60`: Overloaded Modem class for Quectel MC60 (in module `networking.modem.modem_mc60`)
-   `ModemSequans`: Overloaded Modem class for Sequans modem in Pycom devices (work in progress) (in module `networking.modem.modem_sequans`)

```
# through cellular helper module
from networking import cellular
cellular.set_pins(26, 23, 19, 18, 14, 13)
modem = cellular.get_modem_instance()

# or through direct instantiation
from networking.modem.modem_bg600 import ModemBG600
modem = Modem(26, 23, 19, 18, 14, 13)
```

### class Modem constructor

Creates a new instance of the imported Modem class.

-   params
    -   `power_on`: Pin number that controls the power supply of the modem
    -   `power_key`: Pin number that powers on/off the modem
    -   `modem_tx`: Pin number of the modem's UART TX
    -   `modem_rx`: Pin number of the modem's UART RX
    -   `gps_tx`: Pin number of the modem's GPS UART TX
    -   `gps_rx`: Pin number of the modem's GPS UART RX

### Methods

**Modem.is_alive()**

Checks the communication status with the modem using the UART. Sends an `AT` command returns the status of the AT command.

-   returns
    -   `status`: boolean, whether the AT command was executed successfully

**Modem.get_model()**

Returns a string representing the model of the modem as it is reported by the modem itself.

-   returns
    -   `model name`: string, the modem model name as reported by the modem. If any error occurs, `None` is returned

**Modem.power_on()**

Execute the power-on procedure as defined for each Modem type.

**Modem.power_off()**

Execute the power-off procedure as defined for each Modem type.

**Modem.send_at_cmd(command, timeoutms=30000, success_condition="OK")**

**Modem.init(ip_version, apn, technology)**

Initialize all the basic parameters on the modem. Sets the IP version, the APN and the technology used.

-   params
    -   `ip_version`: String value that defines the IP version of the connection.
        -   `IP`
        -   `IPV6`
        -   `IPV4V6`
    -   `apn`: The APN to be used for the connection
    -   `technology`: A string representing the desired technology to use. If the technology is not recognized or un-supported by the modem, the modem will automatically choose the technology. Valid Values:
        -   `GSM`
        -   `NBIoT`
        -   `AUTO`
-   returns
    -   boolean: `True` if all initializations have been completed, `False` otherwise

**Modem.has_sim()**

Query for the SIM status.

-   returns
    -   boolean: `True` if SIM card is inserted and PIN has been entered or PIN does not exists. Otherwise return `False`

**Modem.set_technology(technology)**

Configure the technology locking of the modem.

-   params
    -   `technology`: A string representing the desired technology to use. If the technology is not recognized or un-supported by the modem, the modem will automatically choose the technology. Valid Values:
        -   `GSM`
        -   `NBIoT`
        -   `AUTO`

**Modem.get_network_date_time()**

Get the date/time as provided by the network. It is required that the modem has first registered to the network.

-   returns
    -   `datetime tuple`: (year, month,
        day, 0 (day of week unused), hours, minutes, seconds, (usec unused))

**Modem.wait_for_registration(timeoutms=30000)**

Waits for the network registration to be completed at most `timeoutms` milliseconds and returns the registration status.

-   params
    -   `timeoutms`: maximum time in milliseconds to wait for registration
-   returns
    -   `status`: boolean, the registration status

**Modem.attach()**

Explicitly request for network attachment.

-   returns
    -   boolean: command success status

**Modem.detach()**

Explicitly request for network detachment.

-   returns
    -   boolean: command success status

**Modem.is_attached()**

Query for the status to network attachment.

-   returns
    -   boolean: whether or not the modem has successfully attached to the network

**Modem.connect(timeoutms=30000)**

**Modem.is_connected()**

**Modem.disconnect()**

**Modem.get_rssi()**

**Modem.get_extended_signal_quality()**

**Modem.get_lac_n_cell_id()**

**Modem.get_registered_mcc_mnc()**

**Modem.set_gps_state(power=True)**

**Modem.is_gps_on()**

**Modem.get_gps_position(timeout=300000)**
