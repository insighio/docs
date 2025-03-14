---
title: Alarms
identifier: "cloudplatform@uioverview@alarms"
parent: "uioverview"
weight: 5600
---

With the alarms service, users can define rules to monitor critical measurements and deviations from expected values. The service processes incoming measurements in **real time**, updates the status of the alarm accordingly and optionally notifies the user when the status changes.

Alarms are threshold-based and can be defined for one or more devices for a specific measurement. Users are notified via the insigh.io Console, while they are using the application, but the service also supports email notifications. Since an alarm can be defined for multiple devices with a common measurement, the alarm status is tracked both at the group level and the device level. The service also stores historical status change information, so users can monitor when the alarm was raised or reset for each device.

### Alarm Creation

To create an alarm, select the "Alarms" option on the insigh.io console sidebar, which shows the alarms list, and then click on the "+" button at the navigation bar.

![Alarms List](/images/console_tutorial/alarms/alarms_list.png?width=60pc)

The alarm creation dialog has two steps; the alarm rule configuration and the notification configuration.

In the alarm rule configuration step, the following information is required:

- The **Device(s)** which will be monitored by the alarm. Multiple devices may be selected for each alarm, as long as they have at least a common measurement. Devices can be added or removed when updating an alarm, provided that the added or removed devices also have the alarm measurement. Note that if all devices are selected and then a new device is created, then the alarm needs to be edited and include the new device too. If devices are deleted from the insigh.io console, the respective alarms are also updated.
- The **Measurement** that the alarm monitors. Only one measurement can be defined for each alarm. The measurement cannot change after the alarm creation. If multiple devices are selected, only a common measurement can be selected for the alarm. A measurement coming from the transformations service (i.e., second-level measurement) can also be selected for an alarm.
- The alarm **Name**
- The **Threshold** expression. Users need to provide the threshold operator (e.g., <, >=, etc.) and a value for the threshold. The service monitors incoming measurements and if the expression of the threshold evaluates to true, then the alarm is triggered.
- The **Trigger after # measurements** setting, which defines the required number of consecutive measurements for which the threshold expression evaluates to true to trigger the alarm. For example, if the value is 3, then the alarm will be triggered only after 3 consecutive measurements' threshold expression evaluates to true. The same logic applies for the alarm reset; the alarm will be reset only after n number of consecutive measurements' threshold expression evaluates to false. The default value of this setting is 1. This setting is useful to avoid multiple alarm status changes in volatile measurements.

![Alarm Creation Rule Step](/images/console_tutorial/alarms/alarm_create_rule_step.png?width=30pc)

When all the required fields have been filled, the Next button is enabled and leads to the second step for the notification configuration. The notification is optional and currently only email notification is supported. Regardless of the notification configuration, users are always notified when an alarm is raised in the insigh.io Console application.

![Alarm Creation Notification Step](/images/console_tutorial/alarms/alarm_create_notification_step.png?width=30pc)

- The **Notification** setting, which defaults to false. When enabled, the notification type, recipients and notification level settings are also enabled.
- The **Notification Type** setting only has the "Email" option.
- The **Recipients** is a list of user emails to which the notification will be sent. Only users that are members of the current project can be selected.
- The **Notification Type** has two values: the **Group** and **Device** levels. When in Group Level, the service triggers a notification when the alarm status changes. When in Device Level, the service triggers a notification when the device status changes. More information on how the alarm status is changed and the notification functionality is provided in the following sections.

When the notification configuration is valid, the Create button is enabled and clicking it will create the alarm. The alarms list is refreshed and the alarm is not listed.

![Alarms List Not Empty](/images/console_tutorial/alarms/alarms_list_not_empty.png?width=60pc)

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

The console notifications are always on and are shown in the insigh.io Console. If there are raised alarms then, a notification badge is shown near the "Alarms" option in the sidebar. Moreover, the status of each alarm is shown in the alarms list. Finally, if there are raised alarms, a notification message is shown when the user logs into the application.

![Alarms Console Notifications](/images/console_tutorial/alarms/alarms_console_notification.png?width=60pc)

The status of the alarm is also shown in the alarms list view.

![Alarms List Notifications](/images/console_tutorial/alarms/alarms_list_notification.png?width=60pc)

#### Email Notifications

The alarms service also supports notifications via email. Email notifications are triggered on status changes either in group or at device level:

- **Group Level** notification is triggered when the whole alarm status is changed. The alarm status changes are described in the "Alarm Status" section
- **Device Level** notification is triggered when the status changes at the device level.

### Alarm Info

The alarm info page contains the following information:

- The top card shows the alarm's configuration (i.e., name, measurement, threshold, etc.) and its status.
- The **Devices** card (bottom left) shows the devices that have been configured for the alarm, the status of each device and when was the last status change.
- The **Recipients** card (bottom middle) shows the configured email recipients. It is shown only when the email notification has been enabled for the alarm.
- The **Alarm History** card (bottom right) lists the events of the status changes at the device level. Each event shows the device name, the value of the measurement, the status and the date of the event.

From this view, users can also delete or edit the alarm using the buttons shown in the image.

![Alarms Alarm Info](/images/console_tutorial/alarms/alarm_info.png?width=60pc)
