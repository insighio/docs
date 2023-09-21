---
title: Alarms
identifier: "cloudplatform@uioverview@alarms"
parent: "uioverview"
weight: 5600
---

With the alarms service, users can be notified if a value of a measurement surpasses or drops below a configurable threshold in one or more devices. The service provides:

- An overview of the alarms' status
- The status of each alarm at the device level
- The history of the alarm status changes at the device level

### Alarm Creation

To create an alarm, select the "Alarms" option on the insigh.io console sidebar, which shows the alarms list, and then click on the "+" button at the navigation bar.

![Alarms Alarm Creation](/images/console_tutorial/alarms/alarms_list.png?width=60pc)

In the alarm creation form, the following information needs to be provided:

- The **Device(s)** which will be monitored by the alarm. Multiple devices may be selected for each alarm. Devices can be added or removed when updating an alarm. Note that if all devices are selected and then a new device is created, then the alarm needs to be edited and include the new device too. If devices are deleted from the insigh.io console, the respective alarms are also updated.
- The **Measurement** that the alarm monitors. Only one measurement can be defined for each alarm. The measurement cannot change after the alarm creation. If multiple devices are selected, only a common measurement can be selected for the alarm.
- The alarm **Name**
- The **Threshold** expression. Users need to provide the threshold operator (e.g., <, >=, etc.) and a value for the threshold. The service monitors incoming measurements and if the expression of the threshold evaluates to true, then the alarm is triggered.
- The **Trigger after # measurements** setting, which defines the required number of consecutive measurements for which the threshold expression evaluates to true to trigger the alarm. For example, if the value is 3, then the alarm will be triggered only after 3 consecutive measurements' threshold expression evaluates to true. The same logic applies for the alarm reset; the alarm will be reset only after n number of consecutive measurements' threshold expression evaluates to false. The default value of this setting is 1. This setting is useful to avoid multiple alarm status changes in volatile measurements.
- The **Email Notification** setting, which defaults to false. When enabled, two settings are available: the **Group Level** and **Device Level**. When in Group Level, the service triggers a notification when the alarm status changes. When in Device Level, the service triggers a notification when the device status changes. More information on the notification functionality is provided in the following sections.

![Alarms Alarm Creation](/images/console_tutorial/alarms/alarm_create.png?width=30pc)

### Alarm Status

The following two sections describe the alarm status changes. Note that, for simplicity, the sections ignore the setting **Trigger after # measurements**. In case this setting is higher than 1, then the status changes occur after n consecutive measurements, but other than that the logic is the same.

#### Single Device

If an alarm is configured for one device only, then the alarm status is:

- **Raised** if the threshold expression of the measurement of that device evaluates to true
- **Not Raised** if the threshold expression of the measurement evaluates to false

#### Multiple Devices

If an alarm is configured for multiple devices, then the alarm status is:

- **Raised** if the threshold expression of the measurement of **at least one** device evaluates to true
- **Not Raised** if the threshold expression of the measurement evaluates to false **for all devices**

### Notification

The service provides two ways to notify the user for raised alarms: **Console** and **Email** notifications.

#### Console Notifications

The console notifications are always on and are shown in the insigh.io console. If there are raised alarms then, a notification badge is shown near the "Alarms" option in the sidebar. Moreover, the status of each alarm is shown in the alarms list. Finally, if there are raised alarms, a notification message is shown when the user logs into the application.

![Alarms Console Notifications](/images/console_tutorial/alarms/alarms_console_notification.png?width=60pc)

![Alarms Console Notifications](/images/console_tutorial/alarms/alarms_list_notification.png?width=60pc)

#### Email Notifications

The alarms service also supports notifications via email. Email notifications are triggered on status changes either in group or at device level:

- **Group Level** notification is triggered when the whole alarm status is changed. The alarm status changes are described in the "Alarm Status" section
- **Device Level** notification is triggered when the status changes at the device level.

### Alarm Info

The alarm info page contains the alarm's information (i.e., name, number of devices, measurement, threshold, etc.) at the top of the page and two tables at the bottom with the following information:

- The **Devices** table contains the device ID, Name, the status of the alarm for this device and the date of the last status change
- The **Alarm History** table that contains the events of the status changes at the device level. Each event shows the device ID, the value of the measurement, the status and the date of the measurement.

![Alarms Alarm Info](/images/console_tutorial/alarms/alarm_info.png?width=60pc)

From this view, users can also delete or edit the alarm.
