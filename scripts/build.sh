#!/bin/bash
mkdir -p "${STEAMAPPDIR}" || true

bash "${STEAMCMDDIR}"/steamcmd.sh +force_install_dir "${STEAMAPPDIR}" +login anonymous +app_update "${STEAMAPPID}" +validate +quit
mv -f "${HOMEDIR}"/start-server.sh "${STEAMAPPDIR}"/start-server.sh
cd "${STEAMAPPDIR}" && ./start-server.sh