---
title: lora
#pre: "<b>2. </b>"
identifier: "firmware@api@networking@lora"
parent: "firmware@api@networking"
weight: 1220
---

`lora` module handles the join procedure and data send.

```
from networking import lora
```

### Functions

**lora.set_keys(cfg)**

Utility function to convert hex UID strings to byte arrays to be used in the LoRa operations.

```python
cfg = {}
cfg._DEV_EUI = "a0b1c3d4e5f60011"
cfg._APP_EUI = ""
cfg._APP_KEY = "a0b1c3d4e5f60011a0b1c3d4e5f60011"

(dev_eui, app_eui, app_key) = lora.set_keys(cfg)
```

- params

  - `cfg`
    - `cfg._DEV_EUI`: 8 heximal bytes
    - `cfg._APP_EUI`: 8 heximal bytes optional
    - `cfg._APP_KEY`: 16 heximal bytes

- returns the corresponding byte arrays

  - `dev_eui`
  - `app_eui`
  - `app_key`

**lora.join(cfg, lora_keys)**

Join to a LoRa network using a tuple of (dev_eui,app_eui,app_key). After each hard reset, the LoRa NVRAM will be erased to initiate a fresh Join. If the function is called after a soft reboot, it will try to restore the LoRa NVRAM to speed the join duration.

```python
cfg = {}
cfg._DEV_EUI = "a0b1c3d4e5f60011"
cfg._APP_EUI = ""
cfg._APP_KEY = "a0b1c3d4e5f60011a0b1c3d4e5f60011"
cfg._LORA_REGION = LoRa.EU868
cfg._LORA_ADR = True
cfg._LORA_TX_RETRIES = 1
cfg._LORA_DR = 5
cfg._MAX_CONNECTION_ATTEMPT_TIME_SEC = 120

(status, conn_attempt_duration) = lora.join(cfg, lora.set_keys(cfg))
```

- params
  - `cfg`: an object containing the following configuration options:
    - `cfg._LORA_REGION`: Enumeration as defined by [Pycom documentation](https://docs.pycom.io/firmware/pycom/network/lora/)
      - `LoRa.AS923`
      - `LoRa.AU915`
      - `LoRa.EU868`
      - `LoRa.US915`
      - `LoRa.CN470`
      - `LoRa.IN865`
    - `cfg._LORA_ADR`: boolean, enable/disable Adaptive Data Rate
    - `cfg._LORA_TX_RETRIES`: Integer, the transmission retries in case of failure
    - `cfg._LORA_DR`: the initial data rate for the Request
    - `cfg._MAX_CONNECTION_ATTEMPT_TIME_SEC`: Integer, the timeout in seconds for the LoRa Join operation
  - `lora_keys`: A tuple of (dev_eui,app_eui,app_key)
- returns:
  - `status`: boolean, whether has successfully joined to the LoRa network.
  - `conn_attempt_duration`: The duration in (ms) from the join request till the confirmation of the join or the timeout.

**lora.send(cfg, byte_msg)**

Creates a LoRa socket and sends the byte_msg over it.

- args:
  - `cfg`: an object containing the following configuration options:
    - `cfg._LORA_DR`: LoRa data rate.
    - `cfg._LORA_CONFIRMED`: boolean, if True the message delivery must be confirmed.
    - `cfg._LORA_SOCKET_TIMEOUT`: integer, socket timeout in _seconds_ during transmission
