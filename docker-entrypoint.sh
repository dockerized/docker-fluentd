#!/bin/bash
set -e

PUID=${PUID:-911}
PGID=${PGID:-911}

if [ ! "$(id -u fluent)" -eq "$PUID" ]; then
    usermod -o -u "$PUID" fluent
fi
if [ ! "$(id -g fluent)" -eq "$PGID" ]; then
    groupmod -o -g "$PGID" fluent
fi

exec "$@"
