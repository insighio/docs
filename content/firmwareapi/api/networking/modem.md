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

```py
# through cellular helper module
from networking import cellular
cellular.set_pins(26, 23, 19, 18)
modem = cellular.get_modem_instance()

# or through direct instantiation
from networking.modem.modem_bg600 import ModemBG600
modem = Modem(26, 23, 19, 18)
```

### class constructor

**modem_base.Modem(power_on, power_key, modem_tx, modem_rx, gps_tx, gps_rx)**

Creates a new instance of the imported Modem class.

-   params
    -   `power_on`: Pin number that controls the power supply of the modem (_default: `None`_)
    -   `power_key`: Pin number that powers on/off the modem (_default: `None`_)
    -   `modem_tx`: Pin number of the modem's UART TX (_default: `None`_)
    -   `modem_rx`: Pin number of the modem's UART RX (_default: `None`_)
    -   `gps_tx`: Pin number of the modem's GPS UART TX (_default: `None`_)
    -   `gps_rx`: Pin number of the modem's GPS UART RX (_default: `None`_)

### class methods

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

Low-level function to directly communicate with the modem through AT commands. (The supported AT command list is dependant to the modem model).

```
# default usage
modem.send_at_cmd("ATI")
[DEBUG:root] > ATI
[DEBUG:root] < Quectel
[DEBUG:root]   BG600L-M3
[DEBUG:root]   Revision: BG600LM3LAR02A03
[DEBUG:root]   OK
(True, ['Quectel', 'BG600L-M3', 'Revision: BG600LM3LAR02A03', 'OK'])

modem.send_at_cmd("at-invalid")
[DEBUG:root] > at-invalid
[DEBUG:root] < ERROR
(False, ['ERROR'])
```

```
# custom success condition and timeout
modem.send_at_cmd('AT+CGDATA="PPP",1', 50000, "CONNECT")
[DEBUG:root] > AT+CGDATA="PPP",1
[DEBUG:root] < OK
[DEBUG:root]   CONNECT
(True, ['OK', 'CONNECT'])
```

-   params
    -   `command`: a string with the AT command to be sent to the modem. It is not required to add CR/LF at the end of the string as it is automatically appended.
    -   `timeoutms`: optional parameter, the maximum time in milliseconds to wait for response. (_default 30000 ms_)
    -   `success_condition`: a string or a regular expression that describes the success condition of the command. (_default 'OK'_)
-   returns
    -   `status`: boolean, the success status of the command execution taking into account the `success_condition` parameter
    -   `lines`: string array, the response lines as received by the modem

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
    -   `datetime tuple`: (year, month, day, 0 (day of week unused), hours, minutes, seconds, (usec unused))

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

Execute connection procedure, get IP address and do any required preparations to establish internet access. The base class and the Quectel MC60 implementation establishes a PPP connection to provide internet access to the ESP32 board over UART. On the other hand, Quectel BG600 implementation initializes its internal IP stack to be prepared for AT command based data transmission.

-   params
    -   `timeoutms`: optional argument, the timeout period in milliseconds (_default 30000 ms_)
-   returns
    -   `status`: boolean, the success status of the procedure

**Modem.is_connected()**

Query the internet connection status of the modem.

-   returns
    -   `status`: boolean, the connection status

**Modem.disconnect()**

Execute disconnection procedure.

-   returns
    -   `status`: boolean, the success status of the procedure

**Modem.get_rssi()**

Get the Signal Strength Indicator value.

-   returns
    `rssi`: integer value between `-113` to `-51`. If RSSI is invalid, `-141` will be returned.

**Modem.get_extended_signal_quality()**

Get RSRP and RSRQ values. Applicable for NBIoT & LTE-M.

-   returns
    -   `tuple`:
        -   `rsrp`: integer, value of RSRP. Returns `None` in case of error
        -   `rsrq`: float, value of RSRQ between `-20` to `+30`. Returns `None` in case of error

**Modem.get_lac_n_cell_id()**

Get Location Area Code (LAC) and Cell ID (CI) when successfully registered to the network.

-   returns
    -   `tuple`:
        -   `lac`: string, Two-byte location area code in hexadecimal format. Returns `None` in case of error
        -   `ci`: string, four-byte GERAN/E-UTRAN cell ID in hexadecimal format. Returns `None` in case of error

**Modem.get_registered_mcc_mnc()**

Get Country Code And Network Code of the registered operator network.

-   returns
    -   `tuple`:
        -   `mcc`: integer, the Country Code. Returns `None` in case of error
        -   `mnc`: integer, the Network Code. Returns `None` in case of error

**Modem.set_gps_state(power=True)**

Power on/off the GPS operation (if GPS is supported by the modem). After successfully powering GPS on, the location can be acquired through `Modem.get_gps_position` function.

-   params
    -   `power`: `True` to power on, `False` to power off
-   returns
    -   `status`: boolean, the status of the request response.

**Modem.is_gps_on()**

Query GPS operation status.

-   returns
    -   `status`: boolean, whether the GPS has been powered on

**Modem.get_gps_position(timeout=300000, satellite_number_threshold=5)**

Get the current location as reported by the modem. The termination condition is to have valid GPS coordinates with a minimum of number of satellites of `satellite_number_threshold`. If timeout is reached, and has not yet fixed the position, it returns None values. If the location has been fixed though with less satellite number than the `satellite_number_threshold`, the location data are normally returned.

{{% notice tip %}}
while the function is waiting for the termination conditions to be fulfilled, the function can be manually canceled with if the user has console access, by pressing Ctrl-C.
{{% /notice %}}

```
# No fix
[DEBUG:root] > AT+QGPSGNMEA="GGA"
[DEBUG:root] < +QGPSGNMEA: $GPGGA,,,,,,0,,,,,,,,*66
[DEBUG:root]   OK
[DEBUG:root] [0, 0, 0] Lat: [0, 0.0, 'N'], Lon: [0, 0.0, 'W'], NumSats: 0 @ [0, 0, 0] - [0, 0, 0]
[DEBUG:root] [0, 0, 0] Lat: [0, 0.0, 'N'], Lon: [0, 0.0, 'W'], NumSats: 0 @ [0, 0, 0] - [0, 0, 0]
(None, None, None, 0, None)

# Successful fix
[DEBUG: root] > AT+QGPSGNMEA="GGA"
[DEBUG: root] < +QGPSGNMEA: $GPGGA,110354.00,3758.51337,N,02347.10850,E,1,04,1.0,227.4,M,34.3,M,,*68
[DEBUG: root]   OK
([0, 0, 0, 0, 11, 3, 54, 0], [37, 58.51337, 'N'], [23, 47.1085, 'E'], 4, 1.0)
```

{{% notice tip %}}
Latitude/Longitude values can be converted to float values using the following function (Python example):

    ```py
    def coord_to_double(part1, part2, part3):
        try:
            direction = {'N': 1, 'S': -1, 'E': 1, 'W': -1}
            return (int(part1) + float(part2) / 60.0) * direction[part3]
        except Exception as e:
            logging.exception(e, "error converting coord {} {} {}".format(part1, part2, part3))
            return None

    # example:
    #   [37, 58.51337, 'N'] => 37,975222833
    #   [23, 47.1085, 'E'] => 23,785141667
    ```

{{% /notice %}}

-   returns:
    -   `tuple`
        -   `datetime tuple`: (year, month, day, 0 (day of week unused), hours, minutes, seconds, (usec unused))
        -   `latitude`: Latitude data
        -   `longitude`: Longitude data
        -   `satellites_in_use`: Number of satellites in use
        -   `hdop`: float: value of Horizontal Dilution of Precision (HDOP). Range: 0.5 - 99.9
