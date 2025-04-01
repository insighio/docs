---
title: WiFi
identifier: "firmware@sampleconfigfiles@wifi"
parent: "firmware@sampleconfigfiles"
weight: 4610
---

```py
_CONST_BOARD_TYPE_DEFAULT = "default"
_CONST_BOARD_TYPE_SDI_12 = "sdi12"
_CONST_BOARD_TYPE_ESP_GEN_1 = "ins_esp_gen_1"

_CONST_SENSOR_SI7021 = 'si7021'
_CONST_SENSOR_SHT40 = 'SHT40'

_CONST_MEAS_DISABLED = "disabled"

_BOARD_TYPE = "default"
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



''' measurements that are controlled by string selection. Deactivated if string is equal to "disabled" '''
_MEAS_I2C_1 = "scd30 - C02 / temperature / humidity"
_MEAS_I2C_2 = "disabled"
_MEAS_ANALOG_P1 = "generic analog"
_MEAS_ANALOG_P2 = "disabled"
_MEAS_ANALOG_DIGITAL_P1 = "dht22 - temperature / humidity (digital)"
_MEAS_ANALOG_DIGITAL_P2 = "disabled"


network="wifi"

""" System-related configuration options """
_DEEP_SLEEP_PERIOD_SEC = 300  # tx period in secs
_BATCH_UPLOAD_MESSAGE_BUFFER = None

""" WiFi connection configuration options """
_MAX_CONNECTION_ATTEMPT_TIME_SEC = 20
_CONF_NETS = {'esmera2G': {'pwd': 'movement'}}

_IP_VERSION = "IP"

"""Transport-related configuration options """
protocol = 'mqtt'

protocol_config_instance = None


def get_protocol_config():
    global protocol_config_instance
    if protocol_config_instance is not None:
        return protocol_config_instance

    if protocol == 'coap':
        from protocols import coap_client
        from protocols import coap_config
        protocol_config = coap_config.CoAPConfig()
        protocol_config.server_port = 5683
        protocol_config.use_custom_socket = (_IP_VERSION == "IPV6")
    elif protocol == 'mqtt':
        from protocols import mqtt_client
        from protocols import mqtt_config
        protocol_config = mqtt_config.MQTTConfig()
        protocol_config.server_port = 1884 # only for mqtt
        protocol_config.use_custom_socket = False
        protocol_config.override_measurement_topic = False  #<protocol_override_measurement_topic>
        protocol_config.explicit_message_topic = "<protocol_explicit_message_topic>"
    else:
        print('Not supported transport protocol. Choose between CoAP and MQTT')
        return None

    if _IP_VERSION == "IPV6":
        protocol_config.server_ip = "2001:41d0:701:1100:0:0:0:2060"
    else:
        protocol_config.server_ip = "51.75.72.81"

    """ console.insigh.io security keys """
    protocol_config.message_channel_id = "11111111-2222-3333-4444-555555555555"
    protocol_config.control_channel_id = "22222222-3333-4444-5555-666666666666"
    protocol_config.thing_id = "33333333-4444-5555-6666-777777777777"
    protocol_config.thing_token = "44444444-5555-6666-7777-888888888888"
    protocol_config_instance = protocol_config
    return protocol_config


```
