#!/bin/bash

#
# Salt-Proxy Run Script
#

set -e

# Log Level
LOG_LEVEL=${LOG_LEVEL:-"debug"}

# Run Salt as a Deamon
exec /usr/bin/salt-proxy --log-level=$LOG_LEVEL --proxyid=$PROXYID
