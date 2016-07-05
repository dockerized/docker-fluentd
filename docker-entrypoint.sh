#!/bin/bash

set -e

USER="fluent"
GROUP="fluent"

PUID=${PUID:-911}
PGID=${PGID:-911}

if [ ! "$(id -u fluent)" -eq "$PUID" ]; then
    usermod -o -u "$PUID" $USER
fi
if [ ! "$(id -g fluent)" -eq "$PGID" ]; then
    groupmod -o -g "$PGID" $GROUP
fi
