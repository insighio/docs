---
title: device_info
#pre: "<b>2. </b>"
identifier: "firmware@api@device_info"
parent: "firmware@api"
weight: 1100
---

`device_info` module provides basic information for the board type, firmware and capabilities accompanied by initialization functions and watchdog related controls.

```
import device_info
```

### Functions

**device_info.get_device_fw()**

Get device firmware release and version name

- returns tuple: `(release, version)`

**device_info.get_reset_cause()**

Get device reset cause in integer format. Possible Values --> `0: PWRON_RESET`, `1: HARD_RESET`, `2: WDT_RESET`, `3: DEEPSLEEP_RESET`, `4: SOFT_RESET`

For further reference of the values, advice Pycom documentation @ [machine.reset_case()](https://docs.pycom.io/firmware/pycom/machine/#machinereset_cause)

- returns integer: `(reset_cause)`

**device_info.get_device_id()**

Get a device id based on machine unique id in readable and byte format. This matches with the WiFi MAC address.

- returns tuple: `(id_hex_string, id_bytes)`

**device_info.get_lora_mac()**

Get a device id based on LoRa MAC address in readable and byte format. This matches the _LoRa DevEUI_.

**important** After each `erase_all` call from [pycom-fwtool](https://docs.pycom.io/advance/cli/), _Force Update LoRa Region_ needs to be checked during flashing any new firmware. If region is not set, LoRa MAC will be reported as 0xFFFFFFFFFFFFFFFF. If LoRa is not supported, `None` values are returned.

- returns tuple : `(lora_mac_hex_string, lora_mac_bytes)`

**device_info.get_lte_ids()**

Get all possible LTE Modem-related ids in readable format. If LTE modem is not supported, `None` values are returned.

- returns tuple: `(imei, iccid, imsi, modem_version, lte_fw_version)`

**device_info.get_heap_memory()**

Get heap memory in bytes.

- returns tuple: (allocated, free)

**device_info.get_cpu_temp()**

Get CPU temperature in degrees of Celsius

- returns float: (cpu_temp)

**device_info.set_defaults(heartbeat, wifi_on_boot, wdt_on_boot, wdt_on_boot_timeout_sec, bt_on_boot)**

Set basic configuration of pycom board. By default sets **pybytes** functionality off.

- params
  - _heartbeat_: set on/off the blinking led (boolean).
  - _wifi_on_boot_: set on/off the WiFi status during boot (boolean).
  - _wdt_on_boot_: set on/off the software watchdog (boolean).
  - _wdt_on_boot_timeout_sec_: if _wdt_on_boot_ is true, set the watchdog timeout in seconds (integer).
  - _bt_on_boot_: set on/off the Bluetooth status (boolean).

**device_info.set_led_color(color)**

Set the Pycom's LED to the desired color. Supported string values: `blue`, `red`, `yellow`, `green`, `white`. Alternatively, any hex color representation can be used: ex. 0xFF0000

- params
  - _color_: string of hex integer.

**device_info.wdt_reset()**

Reset watchdog timer.
