---
title: Keys
identifier: "firmware@configuration@keys"
parent: "firmware@configuration"
weight: 2200
---

## Introduction
Communication between the node and Console is facilitated through a set of **keys** and **channels**:
- Each node is associated with a unique **```ID```** and a unique **```KEY```**. These are 128-bit universally unique identifiers (UUIDs) generated during device creation in Console.
- Measurements are transmitted over a **```Data Channel```** while Configuration or any other Control information is transmitted over a **```Control Channel```**. Both are unique on a project basis and are also generated following the UUID principle.

## Guide
1. Enter **Console** and go to the ```DeviceInfo``` Page of the target node.
1. Go to **"Quick Device Data Commands"** menu on the top-right of the page (icon ```...```)
1. Copy **JSON** information by clicking the corresponding icon. This action copies all keys and channels in the cliboard.
1. Go back to the Configurator and place the cursor in the first field (**```ID```**). **Paste** will automatically populate all four fields with the proper key/channel information.
