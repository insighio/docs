---
title: HTTP API
identifier: "cloudplatform@api"
parent: "cloudplatform"
weight: 6000
---

Follows a description of supported API calls for 3rd party integrations. All the examples use 'curl' command as an example.

All calls to device data, require the Device ID and Data Channel ID. They can be retrieved through the Device Info view in console.insigh.io or by calling **Get Device List** command described bellow.

API list:

- [Access Tokens]({{< relref "#access-tokens" >}})
  - [Login Access Token]({{< relref "#login-access-token" >}})
  - [API Access Token]({{< relref "#api-access-token" >}})
- [Get Device List]({{< relref "#get-device-list" >}})
- [Device API]({{< relref "#device-api" >}})
  - [Create Device]({{< relref "#create-device" >}})
  - [Get Device]({{< relref "#get-device" >}})
  - [Get Device by external ID]({{< relref "#get-device-by-external-id"}})
  - [Update Device]({{< relref "#update-device" >}})
  - [Update Device Location]({{< relref "#update-device-location" >}})
  - [Delete Device]({{< relref "#delete-device" >}})
  - [Send command to device]({{< relref "#send-command-to-device" >}})
- [Get Location List]({{< relref "#get-location-list" >}})
- [Measurement API]({{< relref "#measurement-api" >}})
  - [Get Device Last Measurement]({{< relref "#get-device-last-measurement" >}})
  - [Query single Device measurement]({{< relref "#query-single-device-measurement" >}})
  - [Query all Device measurements]({{< relref "#query-all-device-measurements" >}})

## Access Tokens

Access tokens are required in HTTP API calls for authentication. The two most common access tokens types are:

- the login access token, which is issued upon a successful login request and is valid for 24 hours
- the API access token, which is created upon user request with a configurable expiration date

### Login Access Token

The Login Access Token is issued upon a successful login request using the user email/password on console.insigh.io. Each token is valid for 24 hours!

> URL
>
> https://console.insigh.io/mf-rproxy/tokens

#### Example

```bash
curl -s -S -i -X POST -H "Content-Type: application/json" https://console.insigh.io/mf-rproxy/tokens -d '{"email":"<user-email>", "password":"<user-password>"}'
```

#### Output

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

### API Access Token

The API Access Token is similar to the Login Access token, but it has a configurable expiration date. The API Access Token can also be revoked. To create an API Access Token a Login Access Token needs to be provided in the Authorization header. In the request body, the following information is required:

- A token name
- A token type (always equal to 3)
- The token's duration in seconds (omit if it should never expire)

> URL
>
> https://console.insigh.io/mf-rproxy/keys

#### Example

```bash
curl -s -S -i -X POST -H 'accept: */*' -H "Content-Type: application/json" -H "Authorization: <login-access-token>" https://console.insigh.io/mf-rproxy/keys -d '{"name":"<api-access-token-name>", "type":3, "duration":3600}'
```

#### Output

```bash
{"id":"6752b6d1-d50d-4b8e-8ca1-b48210be9142","name":"api token name","value":"<token>","issued_at":"2023-12-12T08:38:57.320343023Z","expires_at":"2023-12-12T09:38:57.320343023Z"}
```

## Get Device List

Get the Device List containing all required IDs for device operation. Each device contains:

- ID (_id_)
- Key (_key_)
- Name (_name_)
- Data Channel (_metadata.dataChannel_)
- Control Channel (_metadata.controlChannel_)
- LoRA APP ID (_metadata.lora.appID_) **when applicable**
- LoRA devEUI (_metadata.lora.devEUI_) **when applicable**

> URL
>
> https://console.insigh.io/mf-rproxy/device/list

#### Example

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/list"
```

#### Output

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

[{"id":"03196209-4ab9-4114-f121-1e1f4bcc698d","name":"device1","key":"e712225c-696d-5925-b227-1222f67708a","metadata":{"dataChannel":"ea9ebfc4-9da5-4eaa-8fd0-31e0ad4b3c77","controlChannel":"11927d38-6445-5b66-78c3-92e2001123ab"}},{"id":"17637322-4415-44d0-6e7e-6292b32ba4b5","name":"deviceLora","key":"5b01513a-4a0c-4b8d-ab63-0c424d7fecef","metadata":{"lora":{"appID":"3","devEUI":"a0b3c54d9edbfc55"},"dataChannel":"ea9ebfc4-9da5-4eaa-8fd0-31e0ad4b3c77","controlChannel":"11927d38-6445-5b66-78c3-92e2001123ab"}}]
```

## Device API

### Create Device

Create a new device, optionally passing device parameters/tags, and get back the full details of the created device.

> URL [POST]
>
> https://console.insigh.io/mf-rproxy/device/create
>
> POST data:
>
> - **name**: The name of the new device
> - **metadata**: a JSON object with device data, settings, tags, etc.

#### Example

```bash
curl -s -S -i -X POST -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/create" -d '{"name":"<device name>", "metadata": {<JSON object>}}'
```

#### Input Example

```bash
curl -s -S -i -X POST -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTgxMTIxNDQsImlhdCI6MTY1ODA3NjE0NCwiaXNzIjoibWFpbmZsdXguYXV0aG4iLCJzdWIiOiJkZW1vQGluc2lnaC5pbyIsInR5cGUiOjB9.auXohlIbMHi8mRA_995kjSB-PABPBtH-btIEwUNyVrw" https://console.insigh.io/mf-rproxy/device/create -d '{"name":"apitest", "metadata": {"deviceId": "100.123.123.312", "status":"disabled", "tags": {"company": "northen lights", "hw_version": "4.0", "facility_id": 929}}}'

```

#### Output

```bash
HTTP/1.1 200 OK
Content-Type: application/json
Access-Control-Allow-Origin: *
Date: Sun, 17 Jul 2022 17:04:22 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Content-Length: 379

{"id":"e27bc4f5-3278-400a-86af-5045b04efa0c","name":"apitest","key":"a0f8ccb5-934b-4a73-99fa-9e1d95c8b197","metadata": {"deviceId": "100.123.123.312", "status":"disabled", "tags": {"company": "northen lights", "hw_version": "4.0", "facility_id": 929}},"status":"Inactive"}
```

### Get Device

Get the device details of a device that has already been created. The "id" returned by device creation of the device list retrieval is required to execute this call.

> URL [GET]
>
> https://console.insigh.io/mf-rproxy/device/\<device-id\>
>
> - **device-id**: The device ID in the for of: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

#### Example

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/<device-id>"
```

#### Input Example

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTgxMTIxNDQsImlhdCI6MTY1ODA3NjE0NCwiaXNzIjoibWFpbmZsdXguYXV0aG4iLCJzdWIiOiJkZW1vQGluc2lnaC5pbyIsInR5cGUiOjB9.auXohlIbMHi8mRA_995kjSB-PABPBtH-btIEwUNyVrw" https://console.insigh.io/mf-rproxy/device/e27bc4f5-3278-400a-86af-5045b04efa0c

```

#### Output

```bash
HTTP/1.1 200 OK
Content-Type: application/json
Access-Control-Allow-Origin: *
Date: Sun, 17 Jul 2022 17:05:22 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Content-Length: 381

{"id":"e27bc4f5-3278-400a-86af-5045b04efa0c","name":"apitest","key":"a0f8ccb5-934b-4a73-99fa-9e1d95c8b197","metadata":{"name":"apitest", "metadata": {"deviceId": "100.123.123.312", "status":"disabled", "tags": {"company": "northen lights", "hw_version": "4.0", "facility_id": 929}}},"status":"Inactive"}
```

### Get Device - by external ID

Get the device details by providing the External Device ID set in the Alternative Data Source option of the device.

> URL [GET]
>
> https://console.insigh.io/mf-rproxy/device/external-id/\<external-device-id\>
>
> - **external-device-id**: The ID used as the device identification in the Alternative Data Source setting. If LoRA plugin is setup, then this ID is the LoRA DevEUI.

#### Example

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/external-id/<external-device-id>"
```

#### Input Example

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTgxMTIxNDQsImlhdCI6MTY1ODA3NjE0NCwiaXNzIjoibWFpbmZsdXguYXV0aG4iLCJzdWIiOiJkZW1vQGluc2lnaC5pbyIsInR5cGUiOjB9.auXohlIbMHi8mRA_995kjSB-PABPBtH-btIEwUNyVrw" https://console.insigh.io/mf-rproxy/device/external-id/f0e1d2c3b4a59687

```

#### Output

```bash
HTTP/1.1 200 OK
Content-Type: application/json
Access-Control-Allow-Origin: *
Date: Sun, 17 Jul 2022 17:05:22 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Content-Length: 381

{"id":"e27bc4f5-3278-400a-86af-5045b04efa0c","name":"apitest","key":"a0f8ccb5-934b-4a73-99fa-9e1d95c8b197","metadata":{"name":"apitest", "plugins":{"attributes":{"externalDevId":"f0e1d2c3b4a59687"},"id":"19eb1c6c-85ef-43a6-0000-8767843d8e87","name":"Elsys-ERS2 Plugin","type":"mqtt"}},"status":"Inactive"}
```

### Update Device

Update the device details of a device that has already been created. The "id" returned by device creation of the device list retrieval is required to execute this call.

In case of success, 200 OK is returned with an empty JSON object.

> URL [PUT]
>
> https://console.insigh.io/mf-rproxy/device/\<device-id\>
>
> - **device-id**: The device ID in the for of: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

#### Example

```bash
curl -s -S -i -X PUT -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/<device-id>" -d '{"name":"<device name>", "metadata": {<JSON object>}}'
```

#### Input Example

```bash
curl -s -S -i -X PUT -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTgxMTIxNDQsImlhdCI6MTY1ODA3NjE0NCwiaXNzIjoibWFpbmZsdXguYXV0aG4iLCJzdWIiOiJkZW1vQGluc2lnaC5pbyIsInR5cGUiOjB9.auXohlIbMHi8mRA_995kjSB-PABPBtH-btIEwUNyVrw" https://console.insigh.io/mf-rproxy/device/e27bc4f5-3278-400a-86af-5045b04efa0c -d '{"name":"apitest-updated", "metadata": {"deviceId": "1234.1234.1234.1234", "status":"active", "tags": {"company": "northen lights", "hw_version": "4.1", "facility_id": 929}}}'

```

#### Output

```bash
HTTP/1.1 200 OK
Content-Type: application/json
Access-Control-Allow-Origin: *
Date: Sun, 17 Jul 2022 17:05:03 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Content-Length: 2

{}
```

### Update Device Location

Update the device location ID stored in the metadata. The validity of the stored location ID is not checked.

In case of success, 200 OK is returned with an empty JSON object.

> URL [PUT]
>
> https://console.insigh.io/mf-rproxy/device/\<device-id\>/locaton
>
> - **device-id**: The device ID in the for of: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

#### Example

```bash
curl -s -S -i -X PUT -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/<device-id>/location" -d '{"location":"<location-id>"}'
```

#### Input Example

```bash
curl -s -S -i -X PUT -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTgxMTIxNDQsImlhdCI6MTY1ODA3NjE0NCwiaXNzIjoibWFpbmZsdXguYXV0aG4iLCJzdWIiOiJkZW1vQGluc2lnaC5pbyIsInR5cGUiOjB9.auXohlIbMHi8mRA_995kjSB-PABPBtH-btIEwUNyVrw" https://console.insigh.io/mf-rproxy/device/e27bc4f5-3278-400a-86af-5045b04efa0c/location" -d '{"location":"<location-id>"}'
```

#### Output

```bash
HTTP/1.1 200 OK
Content-Type: application/json
Access-Control-Allow-Origin: *
Date: Sun, 17 Jul 2022 17:05:03 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Content-Length: 2

{}
```

### Delete Device

Delete the device. **This operation can not be undone**.

In case of success, 200 OK is returned with an empty JSON object.

> URL [DELETE]
>
> https://console.insigh.io/mf-rproxy/device/\<device-id\>
>
> - **device-id**: The device ID in the for of: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

#### Example

```bash
curl -s -S -i -X DELETE -H  "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/<device-id>"
```

#### Input Example

```bash
curl -s -S -i -X DELETE -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTgxMTIxNDQsImlhdCI6MTY1ODA3NjE0NCwiaXNzIjoibWFpbmZsdXguYXV0aG4iLCJzdWIiOiJkZW1vQGluc2lnaC5pbyIsInR5cGUiOjB9.auXohlIbMHi8mRA_995kjSB-PABPBtH-btIEwUNyVrw" https://console.insigh.io/mf-rproxy/device/9f82e9d9-6070-47fb-8ce2-10d86cfab514

```

### Send command to device

Send a command to the device. The command will be received by the device the next time it will be online.

The supported commands by the device is a matter of firmware implementation.

> URL [POST]
>
> https://console.insigh.io/mf-rproxy/device/request/cmd
>
> POST data:
>
> - **id**: the device ID
> - **key**: the device Key
> - **control_channel**: the control channel ID assigned to the device
> - **data**: the payload to be sent to the device

#### Example

```bash
curl -s -S -i -X POST -H  "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/request/cmd" -d '{"id":"<device-id>","key":"<device-key>","control_channel":"<control-channel-id>","data":"<command>"}'
```

#### Input Example

```bash
curl -s -S -i -X POST -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTgxMTIxNDQsImlhdCI6MTY1ODA3NjE0NCwiaXNzIjoibWFpbmZsdXguYXV0aG4iLCJzdWIiOiJkZW1vQGluc2lnaC5pbyIsInR5cGUiOjB9.auXohlIbMHi8mRA_995kjSB-PABPBtH-btIEwUNyVrw" "https://console.insigh.io/mf-rproxy/device/request/cmd" -d '{"id":"e27bc4f5-3278-400a-86af-5045b04efa0c","key":"a0f8ccb5-934b-4a73-99fa-9e1d95c8b197","control_channel":"e0c8cbb0-1234-dae3-f9a1-91ad4538bc9c","data":"reboot"}'


```

#### Output

```bash
HTTP/1.1 200 OK
Content-Type: application/json
Access-Control-Allow-Origin: *
Date: Sun, 17 Jul 2022 17:05:43 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Content-Length: 2

{}
```

## Get Location List

Get the Location List containing all required info per location. Each location contains:

- ID (_id_)
- Name (_name_)
- Address (_address_)
- Comments (_comments_)
- Coordinates (_coordinates_)

> URL
>
> https://console.insigh.io/mf-rproxy/locations/list

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/locations/list"
```

#### output

```bash
HTTP/1.1 200 OK
Content-Type: application/json
Access-Control-Allow-Origin: *
Date: Tue, 13 Feb 2024 11:53:32 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Content-Length: 298

[{"address":"30 Arachovis Street\n10681, Athens\nGreece","comments":"","gps_coord":{"lat":37.9851746,"lng":23.7343275},"id":"549ee266632","name":"Main Office"},{"address":"Acropolis, Athens 105 58","comments":"","gps_coord":{"lat":37.971627,"lng":23.7253098},"id":"49ee2666328","name":"Acropolis"}]
```

## Measurement API

### Get Device Last Measurement

Get device last measurement. Each value holds extra meta info such as time, protocol, unit, etc.

> URL
>
> https://console.insigh.io/mf-rproxy/device/lastMeasurement
>
> Query Arguments:
>
> - **channel**: Data Channel ID
> - **id**: Device ID
> - **exclude-base-name**: (optional) boolean to remove base name from each measurement

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/device/lastMeasurement?channel=<data-channel-id>&id=<device-id>"
```

#### Output

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

### Query Single Device Measurement

Each measurement pack uploaded by a device contains multiple individual measurements (ex. vbatt, uptime). Through this call, it is able to retrieve historic data regarding an individual measurement.

> URL
>
> https://console.insigh.io/mf-rproxy/measurement/query
>
> Query Arguments:
>
> - **name**: (_Required_) the name of the individual measurement (ex. batt)
> - **channel**: (_Required_) the data channel ID of the device
> - **publisher**: (_Required_) the device ID
> - **duration**: query for data produced relative to now timestamp. The data of last hour ("1h"), of last day("1d"), of last 5 minutes (5m) etc. Numeric values express nanoseconds, string values follow the [Influx duration literals](https://docs.influxdata.com/flux/v0.x/spec/lexical-elements/#duration-literals) format
> - **startRange**: query values starting from specific timestamp. Numeric values express epoch timestamp in nanoseconds. String values express timestamp in GMT format `1970-01-01T00:00:00Z`
> - **endRange**: query values till a specific timestamp. Numeric values express epoch timestamp in nanoseconds. String values express timestamp in GMT format `1970-01-01T00:00:00Z`
> - **elapsed**: boolean value to request elapsed time between measurements instead of the measurement values
> - **func**: Function to apply to values (accepted values: `mean`, `median`, `count`, `min`, `max`)
> - **period**: define the group period expressed in [Influx duration literals](https://docs.influxdata.com/flux/v0.x/spec/lexical-elements/#duration-literals) format
> - **limit**: limit the number of the returned values
> - **fill**: when group **period** is defined, select how to fill data in case of missing data (accepted values: `null`, `none`, `linear`, `previous`)
> - **valueFilter**: apply value filter to accept specific data values (ex. `"value" < 3.6`)
> - **valueTransformation**: apply calculation on each returned value (ex. `value * 5`)

#### Examples

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/measurement/query?publisher=<device-id>&name=<measurement-name>&channel=<device-data-channel>&startRange=<epoc timestamp in nanoseconds>&endRange=<epoc timestamp in nanoseconds>"
```

- get vbatt measurements of last 24h

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/measurement/query?publisher=<device id>&name=vbatt&channel=<device data channel>&duration=24h"
```

- get vbatt measurements between 2022-02-01 @ 00:30 and 2022-02-3 @ 23:50

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/measurement/query?publisher=<device id>&name=vbatt&channel=<device data channel>&startRange=2022-02-01T00:30:00Z&endRange=2022-02-03T23:50:00Z"
```

#### Output

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

### Query All Device Measurements

Query all device measurements uploaded during the defined period of time.

> URL
>
> https://console.insigh.io/mf-rproxy/measurement/queryPack
>
> Query Arguments:
>
> - **channel**: (_Required_) the data channel ID of the device
> - **publisher**: the device ID. If omitted, the endpoint returns data for all the channel's devices.
> - **duration**: query for data produced relative to now timestamp. The data of last hour ("1h"), of last day("1d"), of last 5 minutes (5m) etc. Numeric values express nanoseconds, string values follow the [Influx duration literals](https://docs.influxdata.com/flux/v0.x/spec/lexical-elements/#duration-literals) format
> - **startRange**: query values starting from specific timestamp. Numeric values express epoch timestamp in nanoseconds. String values express timestamp in GMT format `1970-01-01T00:00:00Z`
> - **endRange**: query values till a specific timestamp. Numeric values express epoch timestamp in nanoseconds. String values express timestamp in GMT format `1970-01-01T00:00:00Z`
> - **elapsed**: boolean value to request elapsed time between measurements instead of the measurement values
> - **func**: Function to apply to values (accepted values: `mean`, `median`, `count`, `min`, `max`)
> - **period**: define the group period expressed in [Influx duration literals](https://docs.influxdata.com/flux/v0.x/spec/lexical-elements/#duration-literals) format
> - **limit**: limit the number of the returned values
> - **fill**: when group **period** is defined, select how to fill data in case of missing data (accepted values: `null`, `none`, `linear`, `previous`)
> - **valueFilter**: apply value filter to accept specific data values (ex. `"value" < 3.6`)
> - **valueTransformation**: apply calculation on each returned value (ex. `value * 5`)
> - **format**: the response format. Supported values: `json` and `csv`. Default is `json`. If `csv` is used, the data is returned as an attached CSV file in the response.

#### Example (JSON format)

```bash
curl -s -S -i -H "Content-Type: application/json" -H "Authorization: <access-token>" "https://console.insigh.io/mf-rproxy/measurement/queryPack?publisher=<device-id>&channel=<data-channel-id>&duration=24h"
```

#### Output

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

#### Example (CSV format)

Use the -o option to save the CSV data in a file.

```bash
curl -o export.csv -S -H "Authorization: <access-token>" 'https://console.insigh.io/mf-rproxy/measurement/queryPack?channel=<data-channel-id>&duration=24h&format=csv'
```
