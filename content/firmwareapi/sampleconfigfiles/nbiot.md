---
title: NBIoT
weight: 165
---

```py
""" System configuration options """
_WD_PERIOD = 120 # watchdog time for rebooting in seconds
_BOARD_TYPE = "default"
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
_MEAS_BATTERY_STAT_ENABLE = False
_MEAS_BOARD_SENSE_ENABLE = True
_MEAS_BOARD_STAT_ENABLE = True
_MEAS_NETWORK_STAT_ENABLE = True

_CONST_MEAS_DISABLED = "disabled"

""" Load Regulator configuration """
_UC_IO_LOAD_PWR_SAVE_OFF = 'P4'

""" External Sensors configuration """
_UC_IO_ANALOG_DIGITAL_P1 = 'P20'
_UC_IO_ANALOG_DIGITAL_P2 = 'P19'
_UC_IO_ANALOG_P1 = 'P18'
_UC_IO_ANALOG_P2 = 'P17'

''' measurements that are controlled by string selection. Deactivated if string is equal to "disabled" '''
_MEAS_I2C_1 = "disabled"
_MEAS_I2C_2 = "tsl2561 - luminosity"
_MEAS_ANALOG_P1 = "disabled"
_MEAS_ANALOG_P2 = "generic analog"
_MEAS_ANALOG_DIGITAL_P1 = "disabled"
_MEAS_ANALOG_DIGITAL_P2 = "ds18x20 - temperature (OneWire)"


network="nbiot"

""" System-related configuration options """
_DEEP_SLEEP_PERIOD_SEC = 60  # tx period in secs

""" NBIoT-related configuration options """
_MAX_ATTACHMENT_ATTEMPT_TIME_SEC = 90
_MAX_CONNECTION_ATTEMPT_TIME_SEC = 600
_APN = "iot"
_BAND = 20
_IP_VERSION = "IP"

"""Transport-related configuration options """
protocol = 'mqtt'
if protocol == 'coap':
    from protocols import coap_client
    protocol_config = coap_client.CoAPConfig()
    protocol_config.server_port = 5683
    protocol_config.use_custom_socket = (_IP_VERSION == "IPV6")
elif protocol == 'mqtt':
    from protocols import mqtt_client
    protocol_config = mqtt_client.MQTTConfig()
    protocol_config.server_port = 1884 # only for mqtt
    protocol_config.use_custom_socket = False
else:
    print('Not supported transport protocol. Choose between CoAP and MQTT')
    import sys
    sys.exit()

if _IP_VERSION == "IPV6":
    protocol_config.server_ip = "2001:41d0:701:1100:0:0:0:2060"
else:
    protocol_config.server_ip = "51.75.72.81"

""" console.insigh.io security keys """
protocol_config.message_channel_id = "e59ebf54-9aa5-4daa-8dd0-31e05d463977"
protocol_config.thing_id = "71e7f125-4902-44be-b6b9-c880a9fa764d"
protocol_config.thing_token = "b86c51d4-4919-4fde-94a7-b98a72ef10b0"

```
