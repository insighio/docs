---
title: logging
#pre: "<b>2. </b>"
identifier: "firmwareapi@api@logging"
parent: "firmwareapi@api"
weight: 1150
---

The main infrastructure for having consistent format logging with various levels of severity. It can either be used as a class instance or through the default static functions for simplicity

```
import logging

logging.setLevel(logging.INFO)
logging.debug("Test debug message 1")
logging.info("Test info message 1")

# will print
# Test info message 1

logging.setLevel(logging.DEBUG)
logging.debug("Test debug message 2")
logging.info("Test info message 2")

# will print
# Test debug message 2
# Test info message 2
```

### Functions

**logging.setLevel(level)**

Sets the logging level which filters the type of messages that will be printed.

-   params:
    -   _level_: The level macro:
        -   CRITICAL
        -   ERROR
        -   WARNING
        -   INFO
        -   DEBUG

**logging.debug(msg, \*args)**

Print DEBUG message

-   params:
    -   _msg_: The string message to be printed
    -   _args_: The variant list of items that will be printed by implicitly calling str() for each (??)

**logging.info(msg, \*args)**

Print INFO message

-   params:
    -   _msg_: The string message to be printed
    -   _args_: The variant list of items that will be printed by implicitly calling str() for each (??)

**logging.error(msg, \*args)**

Print ERROR message

-   params:
    -   _msg_: The string message to be printed
    -   _args_: The variant list of items that will be printed by implicitly calling str() for each (??)

**logging.exception(e, msg, \*args)**

Print EXCEPTION message along with the stack trace provided by `e` instance.

-   params:
    -   _e_: exception instance caught by `except` statement
    -   _msg_: The string message to be printed
    -   _args_: The variant list of items that will be printed by implicitly calling str() for each (??)

### class constructor

**logging.Logger(name)**

Create an instance of a Logger with _name_.

### class methods

**Logger.log(level, msg, \*args, \*\*kwargs)**

The main logging method that actually constructs and prints the message

**Logger.debug(self, msg, \*args, \*\*kwargs)**

Shorthand call of Logger.log with DEBUG level.

**Logger.info(self, msg, \*args, \*\*kwargs)**

Shorthand call of Logger.log with INFO level.

**Logger.warning(self, msg, \*args, \*\*kwargs)**

Shorthand call of Logger.log with WARNING level.

**Logger.error(self, msg, \*args, \*\*kwargs)**

Shorthand call of Logger.log with ERROR level.

**Logger.critical(self, msg, \*args, \*\*kwargs)**

Shorthand call of Logger.log with CRITICAL level.

**Logger.exc(self, e, msg, \*args)**

Shorthand call of Logger.log with EXCEPTION level. An exception instance must be provided.

**Logger.exception(self, msg, \*args)**

Shorthand call of Logger.log with EXCEPTION level. Queries sys.exc_info for details on the exception.
