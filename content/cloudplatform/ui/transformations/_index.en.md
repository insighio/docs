---
title: Transformations
identifier: "cloudplatform@uioverview@transformations"
parent: "uioverview"
weight: 5300
---

With the transformations service, users can define rules to transform device-originated messages. A transformation rule is defined for a set of devices and contains one or more formulas that will be applied to incoming device messages to generate higher-level measurements. The service listens for incoming messages and applies the transformation rules in real-time. For example, users can define transformations to:

- transform the unit of a measurement (e.g., Celcius to Fahrenheit)
- calculate a new quantity that is derived from one or more measurements (e.g., calculate the absolute value of a measurement, define a polynomial that depends on multiple first-level measurements, etc.)

The generated result is stored as a new measurement, with a user-defined name and unit. This higher-level measurement has the same timestamp as the first-level measurement it was calculated upon. It is then treated by the Console as another device measurement and can be plotted in dashboards, monitored in alarms and used in the integrations service.

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

#### Step 1 - Transformation Rule

![Transformation Dialog Step 1](/images/transformations/transformation_dialog_step_1.png?width=30pc)

Each rule has the following properties:

- A **name** (required)
- A **description** (optional)
- The **device(s)** for which the rule will be applied (required)
- The **formulas** that will be applied on each device message (required)

While selecting devices, the available measurements are fetched and listed to the dialog (click on the "Measurements" accordion item). If more than one device is selected, only the common measurements are taken into account. If the devices do not have common measurements, you will not be able to proceed to the next step.

{{% notice note %}}
To create a rule for a device, the device must have previously sent at least one message to the platform. This is required so that the Console knows what measurements will be available for the formula definition in Step 2.
{{% /notice %}}

After providing a name, a description (optional) and one or more devices, click next to go to the second step to define the formulas.

#### Step 2 - Transformation Formulas

![Transformation Dialog Step 2](/images/transformations/transformation_dialog_step_2.png?width=30pc)

Step 2 shows a list of the formulas that will be applied to the previously selected device messages. To add a new formula to the rule, click "Add".

![Formula Dialog](/images/transformations/formula_dialog.png?width=30pc)

A formula has the following properties:

- A **name** (required)
- A **description** (optional)
- One or more first-level **measurements** that will be used in the formula expression (required)
- The formula **expression** (required)
- The **result name** (required)
- The **result unit** (optional)

##### Expression

The formula expression is a mathematical expression that follows the JavaScript syntax. To build an expression, use the [JavaScript Arithmetic Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#arithmetic_operators) and to apply standard mathematical functions, use the [JavaScript Math functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math).

{{% notice note %}}
For simplicity, you can skip using the "Math." prefix in the expression. For example, to calculate the absolute value of a measurement (that has the symbol x), use abs(x) instead of Math.abs(x).
{{% /notice %}}

In the expression, the selected measurements are mapped to a symbol. If one measurement is selected, it is mapped to "x", if a second measurement is selected, it is mapped to "y" and so on. The measurement to symbol mapping is shown below the measurement selection and above the expression.

The expression needs to be evaluated before adding the formula to the transformation rule. To evaluate the expression, click on the button next to the expression input field. An expression is valid when:

1. The expression syntax is correct
2. All variable symbols are used in the expression

Each time the expression is executed upon receiving a message, its result is stored with the user-defined result name and unit.

After clicking "Add", the formula is added to the transformation rule. A rule can contain more than one formula. Once finished, click "Next" to go to the preview step.

#### Step 3 - Preview

Step 3 shows a preview of the transformation rule application on the last message of the device. Each formula result is highlighted and shown at the bottom of the table.

![Transformation Dialog Step 3](/images/transformations/transformation_dialog_step_3.png?width=30pc)

If more devices are selected for the rule, you can change the device selection from the drop down menu above the preview table.

To create the transformation, click "Create". The "Transformations" page will be refreshed with the new information.

### Transformations List

To see all the project's transformations, select "Transformations" in the Sidebar Menu. The actions column allows for transformation update/deletion.

{{% notice note %}}
Only project administrators can delete a transformation. Project administrators and editors can update a transformation. The "Actions" column is not visible to project viewers.
{{% /notice %}}

![Transformations List](/images/transformations/transformations_list.png)

### Transformation Info

To see transformation information, click on a transformation row in the transformations list view. The view contains 3 information cards:

- The top card shows general information on the rule: its name as the card title, its ID, description, number of devices, number of formulas and creation and update dates.
- The "Formulas" card (bottom-right) shows all formulas information
- The "Status" card (bottom-left) shows formula execution status information per formula and device. This is particularly useful for monitoring. In case of errors, a helpful error log is shown in each case. Convenient filters are also provided to filter for a particular formula or device.

![Transformation Info](/images/transformations/transformation_info.png)

From this page, users can update or delete a transformation, provided that they have the appropriate project access rights.

### Transformations Limitations

In the current implementation, the transformation rules are applied on each received message independently (for the configured devices). This means that the service does not keep any state of previously received messages and therefore users cannot define rules that will be applied across subsequent messages. For example, it is not possible to define a transformation that calculates the moving average of a measurement, which requires to take into account a window of the last n received messages.

Moreover, if a device does not send all the required first-level measurements for a formula, the formula execution will fail and an error message will be shown in the transformation info view. For example, if a formula depends on two first-level measurements (A and B) and the device sends measurement A every hour and measurement B every 15 minutes, the formula will generate a result every hour, when both measurements will be present in the incoming message.
