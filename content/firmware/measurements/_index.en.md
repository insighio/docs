---
title: Measurements
identifier: "firmware@measurements"
parent: "firmware"
weight: 4800
---

The table below lists a sample set of measurements from a basic insigh.io Node board configuration. The measurements contain information on on-board diagnostics, operational and network metadata.

| Measurement       | Unit                    | Explanation                                       | Example Measurement |
| ----------------- | ----------------------- | ------------------------------------------------- | ------------------- |
| board_humidity    | Relative humidity (%RH) | [On-board Sensor] Relative humidity               | 55.89               |
| board_temp        | Degrees celsius (Cel)   | [On-board Sensor] Temperature                     | 18.01               |
| cell_act_duration | Millisecond (ms)        | [Cellular Modem] Network - Activation Duration    | 9300                |
| cell_att_duration | Millisecond (ms)        | [Cellular Modem] Network - Attachment Duration    | 259                 |
| cell_ci           | Text                    | [Cellular Modem] Network - Cell ID                | 26415175            |
| cell_con_duration | Millisecond (ms)        | [Cellular Modem] Network - Connection Duration    | 61                  |
| cell_lac          | Text                    | [Cellular Modem] Network - Location Area Code     | 8130                |
| cell_mcc          | Text                    | [Cellular Modem] Network - Mobile Country Code    | 202                 |
| cell_mnc          | Text                    | [Cellular Modem] Network - Mobile Network Code    | 1                   |
| cell_rsrp         | Decibel Milliwatt (dBm) | [Cellular Modem] Signal Quality - RSRP            | -70                 |
| cell_rsrq         | Decibel Milliwatt (dBm) | [Cellular Modem] Signal Quality - RSRQ            | -11                 |
| cell_rssi         | Decibel Milliwatt (dBm) | [Cellular Modem] Signal Quality - RSSI            | -57                 |
| gps_dur           | Millisecond (ms)        | [GPS] Fix duration                                | 38132               |
| gps_hdop          | Text                    | [GPS] Precision (Horizontal Dilusion)             | 1.2                 |
| gps_lat           | Degrees latitude (lat)  | [GPS] Latitude                                    | 40.83704            |
| gps_lon           | Degrees longitude (lon) | [GPS] Longitude                                   | 21.81997            |
| gps_num_of_sat    | Text                    | [GPS] Number of Satellites in Fix                 | 7                   |
| reset_cause       | Text                    | [Operation] Status Code for Reset                 | 4                   |
| uptime            | Millisecond (ms)        | [Operation] Duration of current measurement cycle | 91836               |
| vbatt             | Millivolt (mV)          | [Operation] Battery Voltage                       | 4084                |
