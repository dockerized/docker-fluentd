#!/bin/bash

set -e

USER="fluent"
GROUP="fluent"

PUID=${PUID:-1001}
PGID=${PGID:-1001}

if [ ! "$(id -u fluent)" -eq "$PUID" ]; then
usermod -o -u $PUID $USER
fi

if [ ! "$(id -g fluent)" -eq "$PGID" ]; then
groupmod -o -g $PGID $GROUP
fi

chown -R $USER:$GROUP /fluentd
chown -R $USER:$GROUP /home/fluent

# if [ "${1:0:1}" = '-' ]; then
#     set -- sudo -u fluent fluentd "$@"
# fi

exec "$@"
