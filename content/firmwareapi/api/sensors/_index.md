---
title: sensors
identifier: "firmwareapi@api@sensors"
parent: "firmwareapi@api"
weight: 1400
---

This section contains a pre-packed list of sensors that are provisioned to work with insigh.io board. Can be extended in the future.

Each of the included sensor libraries is extended to include a `get_reading` function to provide a unified interface.

```python
import sensors

# power on sensors
sensors.set_sensor_power_on("P11")

# read i2c sensor
from sensors import tsl2561
light = tsl2561.get_reading(i2c_sda_pin, i2c_scl_pin)

# read analog sensor
from sensors import analog_generic
volt_analog = analog_generic.get_reading(data_pin)

# read digital sensor
from sensors import dht
(dht_temp, dht_hum) = dht.get_reading(data_pin, 'DHT22')

# power off sensors
sensors.set_sensor_power_off("P11")
```

The following functions are utilities that are used by all the supported sensors.

### Functions

**sensors.set_sensor_power_on(vcc_pin)**

When using insigh.io board, sensors are not always connected to power to avoid drain. Before a measurement cycle, execute this function with the `vcc_pin` that enables the power to all sensors and wait 500ms before querying any sensor.

**sensors.set_sensor_power_off(vcc_pin)**

When using insigh.io board, after each call to `sensors.set_sensor_power_on`, at the end of the measurement cycle it is advised to call `sensors.set_sensor_power_off` to power off sensor current.
