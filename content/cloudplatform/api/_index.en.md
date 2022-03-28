---
title: HTTP API
identifier: "cloudplatform@api"
parent: "cloudplatform"
weight: 6000
---

Follows a description of supported API calls for 3rd party integrations. All API calls will require the certificate for securely accessing the server and the _access token_ (authorization) which is acquired using user email/password. All the examples use 'curl' command as an example.

[Download console.insigh.io certificate](/files/console-insighio.crt)

All calls to device data, require the Device ID and Data Channel ID. They can be retrieved through the Device Info view in console.insigh.io or by calling **Get Device List** command described bellow.

## Get Access Token

First of, it is necessary to get an Access Token that will be used in each API call. Using the email/password of the use account of console.insigh.io. Each token is valid for 24 hours!

> URL
>
> https://console.insigh.io/mf-rproxy/tokens

```bash
curl -s -S -i --cacert ./console-insighio.crt -X POST -H "Content-Type: application/json" https://console.insigh.io/mf-rproxy/tokens -d '{"email":"<user-email>", "password":"<user-password>"}'
```

#### output

```bash
HTTP/2 201
server: nginx/1.16.0
date: Sat, 12 Feb 2022 19:09:55 GMT
content-type: application/json
content-length: 213
access-control-allow-origin: *
strict-transport-security: max-age=63072000; includeSubdomains
x-frame-options: DENY
x-content-type-options: nosniff
access-control-allow-origin: *
access-control-allow-methods: *
access-control-allow-headers: *

{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NDQ3Mjg5OTUsImlhdCI6MTY0NDY5Mjk5NSwiaXNzIjoibWFpbmZsdXguYXV0aG4iLCJzdWIiOiJkZW1vQGluc2lnaC5pbyIsInR5cGUiOjB9.iGDX_Z9sL_K5e16-AI_rnVQaZFed4JTTja56SS9o3NU"}
```

## Get Device List

Get the Device List containing all required IDs for device operation. Each device contains:

-   ID (_id_)
-   Key (_key_)
-   Name (_name_)
-   Data Channel (_metadata.dataChannel_)
-   Control Channel (_metadata.controlChannel_)
-   LoRA APP ID (_metadata.lora.appID_) **when applicable**
-   LoRA devEUI (_metadata.lora.devEUI_) **when applicable**

> URL
>
> https://console.insigh.io/mf-rproxy/device/list

```bash
curl -s -S -i --cacert ./console-insighio.crt -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/list
```

#### output

```bash
HTTP/2 200
server: nginx/1.16.0
date: Sat, 12 Feb 2022 19:41:00 GMT
content-type: application/json
content-length: 8888
access-control-allow-origin: *
strict-transport-security: max-age=63072000; includeSubdomains
x-frame-options: DENY
x-content-type-options: nosniff
access-control-allow-origin: *
access-control-allow-methods: *
access-control-allow-headers: *

{"total":2,"offset":0,"limit":10,"things":[{"id":"03196209-4ab9-4114-f121-1e1f4bcc698d","name":"device1","key":"e712225c-696d-5925-b227-1222f67708a","metadata":{"dataChannel":"ea9ebfc4-9da5-4eaa-8fd0-31e0ad4b3c77","controlChannel":"11927d38-6445-5b66-78c3-92e2001123ab"}},{"id":"17637322-4415-44d0-6e7e-6292b32ba4b5","name":"deviceLora","key":"5b01513a-4a0c-4b8d-ab63-0c424d7fecef","metadata":{"lora":{"appID":"3","devEUI":"a0b3c54d9edbfc55"},"dataChannel":"ea9ebfc4-9da5-4eaa-8fd0-31e0ad4b3c77","controlChannel":"11927d38-6445-5b66-78c3-92e2001123ab"}}]}
```

## Get Device Last Measurement

Get device last measurement. Each value holds extra meta info such as time, protocol, unit, etc.

> URL
>
> https://console.insigh.io/mf-rproxy/device/lastMeasurement
>
> Query Arguments:
>
> -   **channel**: Data Channel ID
> -   **id**: Device ID

```bash
curl -s -S -i --cacert ./console-insighio.crt -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/lastMeasurement?channel=<data-channel-id>&id=<device-id>"
```

#### output

```bash
HTTP/2 200
server: nginx/1.16.0
date: Sat, 12 Feb 2022 19:52:00 GMT
content-type: application/json
content-length: 3744
access-control-allow-origin: *
strict-transport-security: max-age=63072000; includeSubdomains
x-frame-options: DENY
x-content-type-options: nosniff
access-control-allow-origin: *
access-control-allow-methods: *
access-control-allow-headers: *

[{"time":"2021-06-01T10:06:02.533Z","name":"10be24cc37fc-adc_ap1_volt","protocol":"coap","publisher":"03196209-4ab9-4114-f121-1e1f4bcc698d","stringValue":null,"subtopic":"03196209-4ab9-4114-f121-1e1f4bcc698d","unit":"mV","updateTime":"0","value":143},{"time":"2021-06-01T10:06:02.533Z","name":"10be24cc37fc-board_humidity","protocol":"coap","publisher":"03196209-4ab9-4114-f121-1e1f4bcc698d","stringValue":null,"subtopic":"03196209-4ab9-4114-f121-1e1f4bcc698d","unit":"%RH","updateTime":"0","value":24.04},{"time":"2021-06-01T10:06:02.533Z","name":"10be24cc37fc-board_status","protocol":"coap","publisher":"03196209-4ab9-4114-f121-1e1f4bcc698d","stringValue":"running","subtopic":"03196209-4ab9-4114-f121-1e1f4bcc698d","unit":null,"updateTime":"0"}]
```

## Query single Device measurement

Each measurement pack uploaded by a device contains multiple individual measurements (ex. vbatt, uptime). Through this call, it is able to retrieve historic data regarding an individual measurement.

> URL
>
> https://console.insigh.io/mf-rproxy/measurement/query
>
> Query Arguments:
>
> -   **name**: (_Required_) the name of the individual measurement (ex. batt)
> -   **channel**: (_Required_) the data channel ID of the device
> -   **publisher**: (_Required_) the device ID
> -   **duration**: query for data produced relative to now timestamp. The data of last hour ("1h"), of last day("1d"), of last 5 minutes (5m) etc. Numeric values express nanoseconds, string values follow the [Influx duration literals](https://docs.influxdata.com/flux/v0.x/spec/lexical-elements/#duration-literals) format
> -   **startRange**: query values starting from specific timestamp. Numeric values express epoch timestamp in nanoseconds. String values express timestamp in GMT format `1970-01-01T00:00:00Z`
> -   **endRange**: query values till a specific timestamp. Numeric values express epoch timestamp in nanoseconds. String values express timestamp in GMT format `1970-01-01T00:00:00Z`
> -   **elapsed**: boolean value to request elapsed time between measurements instead of the measurement values
> -   **func**: Function to apply to values (accepted values: `mean`, `median`, `count`, `min`, `max`)
> -   **period**: define the group period expressed in [Influx duration literals](https://docs.influxdata.com/flux/v0.x/spec/lexical-elements/#duration-literals) format
> -   **limit**: limit the number of the returned values
> -   **fill**: when group **period** is defined, select how to fill data in case of missing data (accepted values: `null`, `none`, `linear`, `previous`)
> -   **valueFilter**: apply value filter to accept specific data values (ex. `"value" < 3.6`)
> -   **valueTransformation**: apply calculation on each returned value (ex. `value * 5`)

```bash
curl -s -S -i --cacert ./console-insighio.crt -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/measurement/query?publisher=<device-id>&name=<measurement-name>&channel=<device-data-channel>&startRange=<epoc timestamp in nanoseconds>&endRange=<epoc timestamp in nanoseconds>"
```

#### example

-   get vbatt measurements of last 24h

```bash
curl -s -S -i --cacert ./console-insighio.crt -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/measurement/query?publisher=<device id>&name=vbatt&channel=<device data channel>&duration=24h"
```

-   get vbatt measurements between 2022-02-01 @ 00:30 and 2022-02-3 @ 23:50

```bash
curl -s -S -i --cacert ./console-insighio.crt -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/measurement/query?publisher=<device id>&name=vbatt&channel=<device data channel>&startRange=2022-02-01T00:30:00Z&endRange=2022-02-03T23:50:00Z"
```

#### output

```bash
HTTP/2 200
server: nginx/1.16.0
date: Sun, 13 Feb 2022 09:11:17 GMT
content-type: application/json
content-length: 1203
access-control-allow-origin: *
strict-transport-security: max-age=63072000; includeSubdomains
x-frame-options: DENY
x-content-type-options: nosniff
access-control-allow-origin: *
access-control-allow-methods: *
access-control-allow-headers: *

{"name":"vbatt","values":[{"time":"2022-02-13T05:19:46.000Z","value":3532},{"time":"2022-02-13T05:29:43.000Z","value":3532},{"time":"2022-02-13T08:08:46.000Z","value":3502},{"time":"2022-02-13T08:18:45.000Z","value":3500},{"time":"2022-02-13T08:28:38.000Z","value":3498},{"time":"2022-02-13T08:38:35.000Z","value":3496},{"time":"2022-02-13T08:48:34.000Z","value":3494},{"time":"2022-02-13T08:58:28.000Z","value":3494},{"time":"2022-02-13T09:08:24.000Z","value":3490}]}
```

## Query all Device measurements

Query all device measurements uploaded during the defined period of time.

> URL
>
> https://console.insigh.io/mf-rproxy/measurement/queryPack
>
> Query Arguments:
>
> -   **channel**: (_Required_) the data channel ID of the device
> -   **publisher**: (_Required_) the device ID
> -   **duration**: query for data produced relative to now timestamp. The data of last hour ("1h"), of last day("1d"), of last 5 minutes (5m) etc. Numeric values express nanoseconds, string values follow the [Influx duration literals](https://docs.influxdata.com/flux/v0.x/spec/lexical-elements/#duration-literals) format
> -   **startRange**: query values starting from specific timestamp. Numeric values express epoch timestamp in nanoseconds. String values express timestamp in GMT format `1970-01-01T00:00:00Z`
> -   **endRange**: query values till a specific timestamp. Numeric values express epoch timestamp in nanoseconds. String values express timestamp in GMT format `1970-01-01T00:00:00Z`
> -   **elapsed**: boolean value to request elapsed time between measurements instead of the measurement values
> -   **func**: Function to apply to values (accepted values: `mean`, `median`, `count`, `min`, `max`)
> -   **period**: define the group period expressed in [Influx duration literals](https://docs.influxdata.com/flux/v0.x/spec/lexical-elements/#duration-literals) format
> -   **limit**: limit the number of the returned values
> -   **fill**: when group **period** is defined, select how to fill data in case of missing data (accepted values: `null`, `none`, `linear`, `previous`)
> -   **valueFilter**: apply value filter to accept specific data values (ex. `"value" < 3.6`)
> -   **valueTransformation**: apply calculation on each returned value (ex. `value * 5`)

```bash
curl -s -S -i --cacert ~/console-insighio.crt -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/measurement/queryPack?publisher=<device-id>&channel=<data-channel-id>&duration=24h"
```

#### output

```bash
HTTP/1.1 200 OK
Content-Type: application/json
Access-Control-Allow-Origin: *
Date: Sun, 13 Feb 2022 09:27:22 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Content-Length: 13450

[{"time":"1643676909624","batt":3.439,"dr":0,"freq":868500000,"indoor_rh":108.11,"indoor_temp":8.82,"reset_cause":3,"rssi":-99,"snr":-2.5,"temp":8.620000000000001,"vec5_01":633,"vec5_02":619,"vec5_03":586},{"time":"1643680502817","batt":3.44,"dr":0,"freq":868100000,"indoor_rh":108.56,"indoor_temp":9.39,"reset_cause":3,"rssi":-101,"snr":-11,"temp":8.68,"vec5_01":634,"vec5_02":620,"vec5_03":588}]
```