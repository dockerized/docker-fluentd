#!/bin/bash

set -e

USER="fluent"
GROUP="fluent"

PUID=${PUID:-1001}
PGID=${PGID:-1001}

if [ ! "$(id -u fluent)" -eq "$PUID" ]; then
su -c "usermod -o -u $PUID $USER"
fi
if [ ! "$(id -g fluent)" -eq "$PGID" ]; then
su -c "groupmod -o -g $PGID $GROUP"
fi

# if [ "${1:0:1}" = '-' ]; then
#     set -- fluentd "$@"
# fi

exec "$@"
