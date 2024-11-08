---
title: UI overview
identifier: "cloudplatform@uioverview"
parent: "cloudplatform"
weight: 5050
---

The [insigh.io Console UI](https://console.insigh.io) is the management panel to handle all operations related to:

1. Device Management
1. Measurement Visualization
1. Integration with third-party platforms
1. Alarms and monitoring

![UI Overview](/images/console_tutorial/ui_overview.jpg?width=60pc)

The horizontal navbar at the top of the screen contains the following controls:

- The page toolbar which according to the current page provides the relevant controls. For example, in the dashboard list view, the "+" button allows for a new dashboard creation.
- The projects panel which shows the current (or active) project and the user's role within the project. The button next to the project name and user role opens a dialog that allows project switching and pending invitation replies.
- The user settings menu, in which users are able to see user information, change their password and create API tokens.

The vertical sidebar at the left of the screen provides navigation to the data of the selected project. In particular:

- _Project Info_ shows information of the selected project
- [_Dashboard_]({{< relref "./dashboards/_index.en.md" >}}) shows the list of the user-created dashboards
- _Devices_ contains views for device management
- _Locations_ shows the list of the user-created locations
- [_Integrations_]({{< relref "./integrations/_index.en.md" >}}) provides communication with third-party platforms for data forwarding (outbound)
- [_Plugins_]({{< relref "./plugins/_index.en.md" >}}) provides communication with third-party platforms for data ingestion (inbound)
- [_Alarms_]({{< relref "./alarms/_index.en.md" >}}) provides configuration for automatic device monitoring and notifications
