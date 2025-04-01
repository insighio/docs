---
title: gpio_handler
#pre: "<b>2. </b>"
identifier: "firmware@api@gpio_handler"
parent: "firmware@api"
weight: 1130
---

`gpio_handler` module provides the main functionalities for reading input voltages from pins, setting output voltages along with some specific use cases for advanced operations.

```
import gpio_handler
```

### Functions

**gpio_handler.get_input_voltage(pin, voltage_divider, attn, measurement_cycles)**

Get input voltage on a specific pin, for a given voltage divider and attenuator level.

- params:
  - _pin_: pin name (ex. 'P9')
  - _voltage_divider_: based on the board used, specify voltage_divider for correct voltage range reading. (default: 1)
  - _attn_: the attenuation level. The supported values are: ADC.ATTN_0DB, ADC.ATTN_2_5DB, ADC.ATTN_6DB, ADC.ATTN_11DB (default: ADC.ATTN_11DB)
  - _measurement_cycles_: integer number defining the number of measurements that will be read. (default: 500)
- returns
  - _voltage_: the average voltage reading after `_measurement_cycles_` in millivolt (float).

**gpio_handler.get_vin()**

A simple wrapper to take Vin for pycom modules. _Applicable only when using insigh.io board_.

- returns
  - _vin_: the input voltage in millivolt (float).

**gpio_handler.set_pin_value(pin, value)**

Set the Pin value to HIGH or LOW.

- params:
  - _pin_: pin name (ex. 'P9')
  - _value_:
    - `True` or `1`: High
    - `False` or `0`: Low

**gpio_handler.timed_pin_pull_up(pin, durationms)**

Set Pin value to High for _durationms_ time period and then set to Low.

- params:
  - _pin_: pin name (ex. 'P9')
  - _durationms_: the time duration in milliseconds that the Pin will remain High before being set to Low.

**gpio_handler.check_minimum_voltage_threshold()**

If voltage is under 3 Volt, this can be used to terminate the process loop till the battery is adequately charged. Goes into deep sleep for 180 seconds. _Applicable only when using insigh.io board_.
