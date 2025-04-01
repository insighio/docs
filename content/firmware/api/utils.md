---
title: utils
identifier: "api@api@utils"
parent: "firmware@api"
weight: 1160
---

A selection of general purpose functions.

```python
import utils
```

**utils.copyFile(source, destination)**

Copy a file defined by `source` to the absolute path defined in `destination`

- params
  - `source`: absolute path of the source file to be copied
  - `destination`: absolute path of the new file
- returns
  - boolean: the status of the copy operation.

**utils.readFromFile(source)**

Get _as string_ all the data from the file.

- params
  - `source`: absolute path of the source file to be read
- returns
  - string: the contents of the file if successfully read, else empty string `""`

**utils.writeToFile(destination, content)**

Write the `string` defined by `content` to the file with absolute path defined by `destination`

- params
  - `destination`: the absolute file of the target file
  - `content`: the string to be written to the file.
- returns
  - boolean: the status of the copy operation.
