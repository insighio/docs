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

![Dashboard Chart Wizard](/images/console_tutorial/dashboard_chart_wizard.png?width=60pc)

Lets choose the __Line Chart__ for this example. Next screen is the data input definition, data manipulation, etc.

The view contains:
* __Device List__: select one or more devices to operate to
* __Device Measurements__: shows the measurements of the devices, one or more can be selected based on the selected widget type from the previous step. If one device is selected, the list includes all the different measurements the device has ever reported. When multiple devices are selected, shows _only the common measurements between the devices_. To show the union of all the different measurements collected from the devices, deselect the __Filter Common Measurements__ checkbox.
* __Value Type__: select to operate with the raw __Value__ or with the __Elapsed__ time between the Values.
* __Function__ / __Group By__ / __Fill__: Apply a function to the returned values. Optionally, this function can be applied in timed __Groups__ (split all data periods into specific slots and apply the function to all measurements in the slot). When __Group By__ is enabled and no value is found into a time slot, __Fill__ option defines how to handle the missing values. All __Fill__ options have tooltips to explain their functionality
* __Duration__: the default duration per widget to query for data. It is globally overridden when the user explicitly selects a __Measurement Period__ from the __Page Toolbar__. 
* __Advanced__: the checkbox that enables some more advanced features to be applied ton the query. When enabled, a pseudo-query is displayed as an example of how all the selections are applied into a query line.
    *  __Value Filter__: when filled, it can control to filter out values. For example, having a fleet of devices that report battery voltage, `"value" < 3.6` will report back all the devices that have critically low battery and needs attention.
    * __Value Transformation__: when filled, the defined formula will be applied to each value before it is returned. For example, in a specific Soil Sensor, the reported values are in millivolts (mV). To express this in _volumetric water content_ (VWC), the formula `100*(11.9*0.0001*value-0.401)` is applied

![Dashboard Chart Wizard - Data Source](/images/console_tutorial/dahsboard_chart_wizard_data_source_advanced.png?width=60pc)

{{% notice note %}}
When using a __Map__ widget, make sure to manually select both __longitude__ and __latitude__ from the measurement list.
{{% /notice %}}

Each widget configuration ends with the preview of the requested data, before it is inserted into the dashboard. When ready, click the __green check button__ at the upper corner of the dialog and the widget will be automatically added into the dashboard. 

Each widget, can be resized/moved into the dashboard space which is auto expanded. 

Here is an example of a dashboard that monitors the soil moisture in an Olive Grove.

![Dashboard Chart Wizard - example](/images/console_tutorial/dashboard_example.png?width=60pc)

### Widget's context menu

Each widget placed in the dashboard, has a context menu to provide extra functionalities on it.

Options: 
* __edit__: re-opens the Chart Wizard with the configuration of the widget to be edited. 
* __delete__: deletes the widget from the dashboard
* __duplicate__: create a copy of the widget and place it at the end of the dashboard
* __export__: create and download a CSV file with all the included contents of the widget values. 

![Dashboard Chart Wizard - Context Menu](/images/console_tutorial/dashboard_chart_context_menu.png?width=60pc)