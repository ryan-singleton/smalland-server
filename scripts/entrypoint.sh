#!/bin/bash
chown -R steam:steam "${STEAMAPPDIR}"
exec su steam -c "bash ${HOMEDIR}/build.sh"