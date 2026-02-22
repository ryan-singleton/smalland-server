#!/bin/bash
set -e

echo "Updating Smalland dedicated server..."
"${STEAMCMDDIR}/steamcmd.sh" \
    +force_install_dir "${STEAMAPPDIR}" \
    +login anonymous \
    +app_update "${STEAMAPPID}" \
    +quit

echo "Update complete, starting server..."
cd "${STEAMAPPDIR}"
exec /bin/bash /home/steam/scripts/start-server.sh