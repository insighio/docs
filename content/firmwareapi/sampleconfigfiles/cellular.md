---
title: Cellular
identifier: "firmwareapi@sampleconfigfiles@cellular"
parent: "firmwareapi@sampleconfigfiles"
weight: 4620
---

Example configuration file for ESP32 board with Cellular connectivity (NBIoT), CoAP, IPv6, GPS, Scale Weigh, OTA.

```py {linenos=true}
_CONST_BOARD_TYPE_DEFAULT = "default"
_CONST_BOARD_TYPE_SDI_12 = "sdi12"
_CONST_BOARD_TYPE_ESP_GEN_1 = "ins_esp_gen_1"

_CONST_SENSOR_SI7021 = 'si7021'
_CONST_SENSOR_SHT40 = 'SHT40'

_CONST_MEAS_DISABLED = "disabled"

_BOARD_TYPE = "ins_esp_gen_1"
import machine

""" System configuration options """
_WD_PERIOD = 120 # watchdog time for rebooting in seconds

""" Measurement configuration options """
_UC_IO_BAT_MEAS_ON = 27
_UC_IO_BAT_READ = 36

""" Battery Voltage configuration """
_BAT_VDIV = 2
_BAT_ATT = machine.ADC.ATTN_11DB

''' external Sensor related parameters '''
_UC_IO_SENSOR_SWITCH_ON = 25

''' Parameters for i2c sensors '''
_UC_IO_I2C_SDA = 21
_UC_IO_I2C_SCL = 22

_UC_INTERNAL_TEMP_HUM_SENSOR = _CONST_SENSOR_SHT40

""" Load Regulator configuration """
_UC_IO_LOAD_PWR_SAVE_OFF = None

""" External Sensors configuration """
_UC_IO_ANALOG_DIGITAL_P1 = 32

''' measurements that are controlled by boolean values '''
_MEAS_BATTERY_STAT_ENABLE = True
_MEAS_BOARD_SENSE_ENABLE = True
_MEAS_BOARD_STAT_ENABLE = False
_MEAS_NETWORK_STAT_ENABLE = True
_MEAS_TEMP_UNIT_IS_CELSIUS = True



''' measurements that are controlled by string selection. Deactivated if string is equal to "disabled" '''
_MEAS_I2C_1 = "tsl2561 - luminosity"
_MEAS_I2C_2 = "disabled"
_MEAS_ANALOG_P1 = "<meas-sensor-a-p1>"
_MEAS_ANALOG_P2 = "<meas-sensor-a-p2>"
_MEAS_ANALOG_DIGITAL_P1 = "ds18x20 - temperature (OneWire)"
_MEAS_ANALOG_DIGITAL_P2 = "<meas-sensor-a-d-p2>"

_UC_IO_SCALE_CLOCK_PIN = 33
_UC_IO_SCALE_DATA_PIN = 4
_UC_IO_SCALE_SPI_PIN = 12

_UC_IO_SCALE_OFFSET = -130207.3
_UC_IO_SCALE_SCALE = 43.737766666666666

_MEAS_GPS_ENABLE = True
_MEAS_SCALE_ENABLED = True
_MEAS_GPS_TIMEOUT = 120
_MEAS_GPS_SATELLITE_FIX_NUM = 4

_CHECK_FOR_OTA = True

network="cellular"

""" System-related configuration options """
_DEEP_SLEEP_PERIOD_SEC = 300  # tx period in secs
_BATCH_UPLOAD_MESSAGE_BUFFER = 144

""" Cellular-related configuration options """
_MAX_ATTACHMENT_ATTEMPT_TIME_SEC = 90
_MAX_CONNECTION_ATTEMPT_TIME_SEC = 600
_APN = "iot"
_BAND = "<cell-band>"
_IP_VERSION = "IPV6"
_CELLULAR_TECHNOLOGY = "NBIoT"

_UC_IO_RADIO_ON = 26
_UC_IO_PWRKEY = 23
_UC_UART_MODEM_TX = 19
_UC_UART_MODEM_RX = 18

"""Transport-related configuration options """
protocol = 'coap'

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
