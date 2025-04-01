---
title: scd30
identifier: "firmware@api@sensors@scd30"
parent: "firmware@api@sensors"
weight: 1450
---

A wrapper module for reading values provided by i2c sensor SCD30 - Sensor Module for HVAC and Indoor Air Quality Applications.

### Functions

**scd30.get_reading(sda_pin, scl_pin, vcc_pin=None)**

Returns air quality readings, for given I2C SCL/SDA and VCC pins. If `vcc_pin` is defined it will first power on sensors and it will power off sensors at the end.

Assumes that the i2c address is: **0x61**

```python
from sensors import scd30
(co2, temperature, humidity) = scd30.get_reading('P9', 'P10')
```

- params
  - `sda_pin`: i2c SDA pin.
  - `scl_pin`: i2c SCL pin.
  - `vcc_pin`: (optional) the pin that controls the power to the sensors.
- returns tuple (co2, temperature, humidity)
  - `co2`: The CO2 measured in parts-per-million (ppm)
  - `temperature`: float number with temperature in Celsius
  - `humidity`: float number with relative humidity
