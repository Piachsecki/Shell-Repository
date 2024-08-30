#!/bin/bash

# -4 as an argument to limit to tcpv4 ports

netstat -nutl  ${1} | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'
