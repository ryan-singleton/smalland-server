#!/bin/bash
mkdir -p "${STEAMAPPDIR}" || true

bash "${STEAMCMDDIR}"/steamcmd.sh \
    +force_install_dir "${STEAMAPPDIR}" \
    +login anonymous \
    +app_update "${STEAMAPPID}" validate \
    +quit

cd "${STEAMAPPDIR}" && bash "${HOMEDIR}/start-server.sh"