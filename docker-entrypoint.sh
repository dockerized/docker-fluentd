#!/bin/bash

set -e

USER="fluent"
GROUP="fluent"

PUID=${PUID:-1001}
PGID=${PGID:-1001}

if [ ! "$(id -u fluent)" -eq "$PUID" ]; then
    su -c << EOF
        usermod -o -u $PUID $USER
    EOF
fi
if [ ! "$(id -g fluent)" -eq "$PGID" ]; then
    su -c << EOF
        groupmod -o -g $PGID $GROUP
    EOF
fi

# if [ "${1:0:1}" = '-' ]; then
#     set -- fluentd "$@"
# fi

exec "$@"
