---
title: udp_client
identifier: "firmware@api@protocols@udp_client"
parent: "firmware@api@protocols"
weight: 1350
---

A single-function module wrapping the use of sockets to send UDP data over an already active data connection.

**udp.udp_send(remote_host, remote_port, msg)**

Send data over UDP.

- params:
  - `remote_host`: the IP of the remote host
  - `remote_port`: the Port of the remote host to accept UDP data
  - `msg`: the string or bytes message to send
