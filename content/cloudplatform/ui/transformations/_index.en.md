---
title: Transformations
identifier: "cloudplatform@uioverview@transformations"
parent: "uioverview"
weight: 5300
---

With the transformations service, users can define rules to transform incoming messages. The service listens for incoming messages and applies user-defined mathematical formulas to create higher-level measurements. For example, users can define transformations to:

- transform the unit of a measurement (e.g., Celcius to Fahrenheit)
- calculate a new quantity that is derived from one or more measurements (e.g., calculate the absolute value of a measurement, define a polynomial that depends on multiple first-level measurements, etc.)

The generated result is stored as a new measurement, with a user-defined name and unit. It is then treated by the Console as another device measurement and can be plotted in dashboards, monitored in alarms and used in the integrations service.

{{% notice note %}}
Project viewers cannot create transformation rules. Also, project editors cannot delete already created transformations. The relevant buttons are disabled.
{{% /notice %}}

### Create Transformation

To create a new transformation rule, select "Transformations" in the Sidebar Menu and then click the "+" (Add new) button at the right of the top navbar.

![Create Transformation](/images/transformations/create_transformation.png)

The transformations dialog appears, containing three steps:

- Step 1 contains the rule's general properties
- Step 2 defines the formulas that will be executed on every incoming message for the previously selected device(s)
- Step 3 shows a preview of the defined rule applied on the last received device message

![Transformation Dialog Step 1](/images/transformations/transformation_dialog_step_1.png?width=30pc)

Each rule has the following properties:

1. A **name** (required)
2. A **description** (optional)
3. The **device(s)** for which the rule will be applied (required)
4. The **formulas** that will be applied on each device message (required)

While selecting devices, the available measurements are fetched and listed to the dialog (click on the "Measurements" accordion item). If more than one device is selected, only the common measurements are taken into account. If the devices do not have common measurements, you will not be able to proceed to the next step.

{{% notice note %}}
To create a rule for a device, the device must have previously sent at least one message to the platform. This is required so that the Console knows what measurements will be available for the formula definition in Step 2.
{{% /notice %}}

After providing a name, a description (optional) and one or more devices, click next to go to the second step to define the formulas.
