---
title: LoRA
identifier: "firmwareapi@sampleconfigfiles@lora"
parent: "firmwareapi@sampleconfigfiles"
weight: 4630
---

Example configuration file for Pycom board with LoRA connectivity and SDI-12 enabled sensor.

```py
_CONST_BOARD_TYPE_DEFAULT = "default"
_CONST_BOARD_TYPE_SDI_12 = "sdi12"
_CONST_BOARD_TYPE_ESP_GEN_1 = "ins_esp_gen_1"

_CONST_SENSOR_SI7021 = 'si7021'
_CONST_SENSOR_SHT40 = 'SHT40'

_CONST_MEAS_DISABLED = "disabled"

_BOARD_TYPE = "sdi12"
""" System configuration options """
_WD_PERIOD = 120 # watchdog time for rebooting in seconds

""" Measurement configuration options """
_UC_IO_BAT_MEAS_ON = 'P23'
_UC_IO_CHARGER_OFF = 'P22'
_UC_IO_WATCHDOG_RESET = 'P21'
_UC_IO_BAT_READ = 'P13'
_UC_IO_CUR_READ = 'P14'

""" Battery Voltage configuration """
_BAT_VDIV = 11
_BAT_ATT = 0
""" Current Sensor configuration """
_CUR_VDIV = 1
_CUR_ATT = 3
_CUR_GAIN = 100
_CUR_RSENSE = 0.08
_CUR_VREF_mV = 0

''' external Sensor related parameters '''
_UC_IO_SENSOR_SWITCH_ON = 'P11'

''' Parameters for i2c sensors '''
_UC_IO_I2C_SDA = 'P9'
_UC_IO_I2C_SCL = 'P10'

_UC_INTERNAL_TEMP_HUM_SENSOR = _CONST_SENSOR_SI7021

""" Load Regulator configuration """
_UC_IO_LOAD_PWR_SAVE_OFF = 'P4'

""" External Sensors configuration """
_UC_IO_ANALOG_DIGITAL_P1 = 'P20'
_UC_IO_ANALOG_DIGITAL_P2 = 'P19'
_UC_IO_ANALOG_P1 = 'P18'
_UC_IO_ANALOG_P2 = 'P17'

''' measurements that are controlled by boolean values '''
_MEAS_BATTERY_STAT_ENABLE = True
_MEAS_BOARD_SENSE_ENABLE = True
_MEAS_BOARD_STAT_ENABLE = False
_MEAS_NETWORK_STAT_ENABLE = True
_MEAS_TEMP_UNIT_IS_CELSIUS = True

_CHECK_FOR_OTA = True

_SDI12_SENSOR_1_ENABLED = True
_SDI12_SENSOR_2_ENABLED = False

_SDI12_SENSOR_1_ADDRESS = "1"
_SDI12_SENSOR_2_ADDRESS = "1"

_SDI12_WARM_UP_TIME_MSEC = 1000
""" Load Regulator configuration """
_UC_IO_LOAD_PWR_SAVE_OFF = 'P20'
_UC_IO_SENSOR_PWR_SAVE_OFF = 'P19'

""" SDI-12 """
_UC_IO_DRV_IN = 'P3'
_UC_IO_RCV_OUT = 'P4'
_UC_IO_DRV_RCV_ON = 'P8'


network="lora"

""" System-related configuration options """
_DEEP_SLEEP_PERIOD_SEC = 300
_BATCH_UPLOAD_MESSAGE_BUFFER = None

""" LoRa example configuration options """
_MAX_CONNECTION_ATTEMPT_TIME_SEC = 60

""" LoRa-related configuration options """
_DEV_EUI = "1234567890ABCDEF"
_APP_EUI = "0000000000000000"
_APP_KEY = "1234567890ABCDEF1234567890ABCDEF"

from network import LoRa
_LORA_REGION = LoRa.EU868
_LORA_ADR = True
_LORA_DR = 5
_LORA_CONFIRMED = False
_LORA_TX_RETRIES = 1
_LORA_SOCKET_TIMEOUT = 30
_LISTEN_DL_MSG = False
_LORA_SOCKET_BUFFER_SIZE = 128
```
