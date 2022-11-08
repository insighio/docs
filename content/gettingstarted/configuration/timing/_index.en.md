---
title: Timing
identifier: "gettingstarted@configuration@timing"
parent: "gettingstarted@configuration"
weight: 85
---

Final step, before applying the configuration, is to set up the measurement/upload period.

## Measurement Period

-   `Periodic`: Execute measurements every specified period of time in seconds
    ![measurement timing](/images/webui-timing.png?width=50pc)
-   `Time scheduled`: Execute measurements at 2 specific times during the day
    ![measurement timing](/images/webui-timing-scheduled.png?width=50pc)

## Upload Period

-   `Batch Upload disabled`: The device will connect to the network and upload the measurements every time it wakes up to execute a measurement cycle. This option provides live data in the expense of increased battery consumption.
-   `Batch Upload enabled` : The device will store a specific number of measurements before it will connect to the network and upload them. The number of stored measurements can be defined by `Message Buffer Size` field. Thus, in case the measurements are executed Periodically every 300 seconds and Message Buffer Size have value 50, the device is expected to upload data every: 300 seconds \* 50 = 4 hours and 10 minutes approximately.

Hit **Save** button to proceed to the final screen and the configuration is ready!
