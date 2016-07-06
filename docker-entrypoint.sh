#!/bin/bash

set -e

USER="fluent"
GROUP="fluent"

PUID=${PUID:-1001}
PGID=${PGID:-1001}

if [ ! "$(id -u fluent)" -eq "$PUID" ]; then
    su -c << BASH
        usermod -o -u $PUID $USER
    BASH
fi
if [ ! "$(id -g fluent)" -eq "$PGID" ]; then
    su -c << BASH
        groupmod -o -g $PGID $GROUP
    BASH
fi

# if [ "${1:0:1}" = '-' ]; then
#     set -- fluentd "$@"
# fi

exec "$@"
