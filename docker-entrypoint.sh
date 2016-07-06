#!/bin/bash

set -e

USER="fluent"
GROUP="fluent"
FLUENTD_OPT=""
FLUENTD_CONF="fluent.conf"

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

sudo -u fluent fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
