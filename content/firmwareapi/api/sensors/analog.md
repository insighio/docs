---
title: analog
identifier: "firmwareapi@api@sensors@analog"
parent: "firmwareapi@api@sensors"
weight: 1410
---

A wrapper module for reading analog values from a pin.

### Functions

**analog_generic.get_reading(data_pin, vcc_pin=None)**

Get the input voltage of `data_pin` in millivolt (mV). If `vcc_pin` is defined it will first power on sensors and it will power off sensors at the end.

- params
  - `data_pin`: the analog input pin name where the sensor is connected to.
  - `vcc_pin`: (optional) the pin that controls the power to the sensors.
- returns
  - integer: the analog measurement in millivolt (mV).

Example with `vcc_pin` defined

```python
# read analog sensor
from sensors import analog_generic
volt_analog = analog_generic.get_reading(data_pin, "P11")
```

Example using `vcc_pin` separately.

```python
import sensors

# power on sensors
sensors.set_sensor_power_on("P11")

# read analog sensor
from sensors import analog_generic
volt_analog = analog_generic.get_reading(data_pin)

# power off sensors
sensors.set_sensor_power_off("P11")
```
