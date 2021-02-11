---
title: LoRA
weight: 166
---

```py {linenos=true}
""" System configuration options """
_WD_PERIOD = 120 # watchdog time for rebooting in seconds
_BOARD_TYPE = "sdi12"
_CONST_BOARD_TYPE_DEFAULT = "default"
_CONST_BOARD_TYPE_SDI_12 = "sdi12"

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

''' measurements that are controlled by boolean values '''
_MEAS_BATTERY_STAT_ENABLE = True
_MEAS_BOARD_SENSE_ENABLE = True
_MEAS_BOARD_STAT_ENABLE = False
_MEAS_NETWORK_STAT_ENABLE = False

_CONST_MEAS_DISABLED = "disabled"

""" Load Regulator configuration """
_UC_IO_LOAD_PWR_SAVE_OFF = 'P20'
_UC_IO_SENSOR_PWR_SAVE_OFF = 'P19'

""" SDI-12 """
_UC_IO_DRV_IN = 'P3'
_UC_IO_RCV_OUT = 'P4'
_UC_IO_DRV_RCV_ON = 'P8'

_SDI12_SENSOR_1_ENABLED = True
_SDI12_SENSOR_2_ENABLED = False

_SDI12_SENSOR_1_ADDRESS = "0"
_SDI12_SENSOR_2_ADDRESS = "1"

_SDI12_WARM_UP_TIME_MSEC = 1000


network="lora"

""" System-related configuration options """
_DEEP_SLEEP_PERIOD_SEC = 60  # tx period in secs

""" LoRa example configuration options """
_MAX_CONNECTION_ATTEMPT_TIME_SEC = 60

""" LoRa-related configuration options """
_DEV_EUIs = '1111111111111111'
_APP_EUIs = ''
_APP_KEYs = '10101010101010101010101010101010'

from network import LoRa
_LORA_REGION = LoRa.EU868
_LORA_ADR = True
_LORA_DR = 5 # data rate in case ADR is false
_LORA_CONFIRMED = False # confirmed transmission or not
_LORA_TX_RETRIES = 1
_LORA_SOCKET_TIMEOUT = 30 # socket timeout for sending/receiving messages
_LISTEN_DL_MSG = False # set to true if we want to listen for DL message
_LORA_SOCKET_BUFFER_SIZE = 128 # max buffer for rx

```
