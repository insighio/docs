---
title: Dashboards
identifier: "cloudplatform@uioverview@dashboards"
parent: "uioverview"
weight: 5300
---

Up to this point, devices have been created and data are being exchanged. A quick and useful way of making use of the data is to visualize them in custom dashboards. 

Navigate in the __Dashboard__ through the menu, create a new Dashboard and click in.

![Dashboard List](/images/console_tutorial/dashboard_list.png?width=60pc)

Now, the dashboard view is loaded along with tools to provide controls for manipulating the charts.

![Dashboard List](/images/console_tutorial/dashboard_tools.png?width=60pc)

By clicking the __Add New__ option, the __Chart Wizard__ is displayed that will go through steps to accurately define the required settings per widget type. 

The supported widget types are: 
* __Text with history__: Line chart without axis values that contains text in the middle responsible for displaying the current value and the percentage of difference between current value and teh value before the defined period of time. Specially recommended when displaying data that need to be chronically compared. 
* __Line Chart__: Simple Line chart graph, good for displaying most of the device measurements
* __Gauge__: Gauge view for displaying numeric values in a defined value range
* __Divider__: simple visual and organizational tool to separate charts in groups
* __Text__: Displays the current value of the selected measurement regardless of the measurement data type
* __Bars__: similar to __Line Chart__ though the data lines are displayed in bars
* __Step Plot__: similar to __Line Chart__ though the data lines are displayed in steps
* __Map__: A map widget that if longitude and latitude are defined, markers will be placed on the map back by OpenStreet Map.

![Dashboard Chart Wizard](/images/console_tutorial/dashboard_chart_wizard.png)

Lets choose the __Line Chart__ for this example. Next screen is the data input definition, data manipulation, etc.
