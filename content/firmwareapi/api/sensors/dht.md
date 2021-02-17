---
title: dht
identifier: "firmwareapi@api@sensors@dht"
parent: "firmwareapi@api@sensors"
weight: 1430
---

A wrapper module for reading values provided by DHT11/DHT22 sensor.

### Functions

**dht.get_reading(data_pin, dht_model, vcc_pin=None)**

Returns temperature & humidity reading, for given VCC and DATA pins. If `vcc_pin` is defined it will first power on sensors and it will power off sensors at the end.

```python
from sensors import dht

(dht_temp_11, dht_hum_11) = dht.get_reading(data_pin, 'DHT11')

(dht_temp_22, dht_hum_22) = dht.get_reading(data_pin, 'DHT22')
```

- params
  - `data_pin`: the input pin name where the sensor data is connected to.
  - `dht_model`: string value to select between DHT11 and DHT22
    - `DHT11`
    - `DHT22`
  - `vcc_pin`: (optional) the pin that controls the power to the sensors.
- returns tuple (temp, hum)
  - `temperature`: float number with temperature in Celsius
  - `humidity`: float number with relative humidity

### Copyright and general info

    Based on [https://github.com/JurassicPork/DHT_PyCom/tree/pulses_get]
    Extensions: Renamed module filename to dht (from dth.py) and added wrapper function
    For hardware connection: YELLOW/WHITE: PIN1 VCC through GPIO, PIN2: DATA through GPIO, PIN3: NC, PIN4: GDN. Use also a 4.7k PULL-UP for DATA
