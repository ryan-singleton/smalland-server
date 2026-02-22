#!/bin/bash

set -e

# ensure directory exists
mkdir -p "${STEAMAPPDIR}"

# first run: login & app_update
bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
  +force_install_dir "${STEAMAPPDIR}" \
  +app_update "${STEAMAPPID}" \
  +quit

# second run: ensure files are correct
bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
  +force_install_dir "${STEAMAPPDIR}" \
  +app_update "${STEAMAPPID}" validate \
  +quit

# move and run
mv "${HOMEDIR}/start-server.sh" "${STEAMAPPDIR}/start-server.sh"
cd "${STEAMAPPDIR}"
exec ./start-server.sh