---
title: wifi
#pre: "<b>2. </b>"
identifier: "firmware@api@networking@wifi"
parent: "firmware@api@networking"
weight: 1210
---

`wifi` module handles the connection to a WiFi SSID and its disconnection.

```
from networking import wifi
```

### Functions

**wifi.connect(known_nets, max_connection_attempt_time_sec, force_no_scan=False)**

Connect to WiFi network based on a predefined list of candidates.

```python
known_nets = {
  'TEST_SSID': {'pwd': 'TEST_PASS_123'},
  'TEST_SSID2': {'pwd': 'TEST_PASS_456'}
}
max_connection_attempt_time_sec = 120
(connection_status, conn_attempt_duration, scan_attempt_duration, channel, rssi) = wifi.connect(known_nets, max_connection_attempt_time_sec, False)
```

- params
  - `known_nets`: a dictionary with the 'known' networks. The dictionary keys are the SSIDs and the objects contain the password for each SSID. Sample:
    - {'WIFI_SSID': {'pwd': 'WIFI_PASS_123'}}
  - `max_connection_attempt_time_sec`: the seconds to wait for the `network.WLAN.isconnected()` to be true.
  - `force_no_scan`: enable/disable the SSID scanning. If True, the first SSID/password from the knonw_nets will be used to explicitly connect to.
- returns:
  - `connection_status`: Boolean, whether connection was successful
  - `conn_attempt_duration`: The duration in (ms)between the connection request initiation and the connection success or timeout.
  - `scan_attempt_duration`: if `force_no_scan` is False, it will return the duration in (ms) to complete a WiFi scan.
  - `channel`: if `connection_status` is True, returns the WiFi Channel of the connected WiFi Access Point.
  - `rssi`: if `connection_status` is True, returns the RSSI of the WiFi link.

**wifi.deactivate()**

Actions implemented when turning off wifi. This includes WiFi disconnection (if connected) followed by WiFi deinitialization.

- returns:
  - `deactivation_status`: Boolean, whether disconnection was successful
  - `deactivation_duration`: the duration in (ms) to complete procedure
