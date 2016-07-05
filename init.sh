#!/bin/bash
set -e

USER="fluent"
GROUP="fluent"

PUID=${PUID:-911}
PGID=${PGID:-911}

addgroup -g ${PGID} ${GROUP}
adduser -u ${PUID} -G ${GROUP} -h /home/${USER} ${USER}
