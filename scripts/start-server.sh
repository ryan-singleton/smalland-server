#!/bin/bash
set -e

DEPLOYMENTID="50f2b148496e4cbbbdeefbecc2ccd6a3"
CLIENTID="xyza78918KT08TkA6emolUay8yhvAAy2"
CLIENTSECRET="aN2GtVw7aHb6hx66HwohNM+qktFaO3vtrLSbGdTzZWk"

PARAMS="/Game/Maps/WorldGame/WorldGame_Smalland"
PARAMS="${PARAMS}?SERVERNAME=\"${SERVERNAME}\""
PARAMS="${PARAMS}?WORLDNAME=\"${WORLDNAME}\""
[ -n "${PASSWORD}" ] && PARAMS="${PARAMS}?PASSWORD=\"${PASSWORD}\""
[ "${FRIENDLYFIRE}"     = "1" ] && PARAMS="${PARAMS}?FRIENDLYFIRE"
[ "${PEACEFULMODE}"     = "1" ] && PARAMS="${PARAMS}?PEACEFULMODE"
[ "${KEEPINVENTORY}"    = "1" ] && PARAMS="${PARAMS}?KEEPINVENTORY"
[ "${NODETERIORATION}"  = "1" ] && PARAMS="${PARAMS}?NODETERIORATION"
[ "${PRIVATE}"          = "1" ] && PARAMS="${PARAMS}?PRIVATE"
PARAMS="${PARAMS}?lengthofdayseconds=${LENGTHOFDAYSECONDS}"
PARAMS="${PARAMS}?lengthofseasonseconds=${LENGTHOFSEASONSECONDS}"
PARAMS="${PARAMS}?creaturehealthmodifier=${CREATUREHEALTHMODIFIER}"
PARAMS="${PARAMS}?creaturedamagemodifier=${CREATUREDAMAGEMODIFIER}"
PARAMS="${PARAMS}?nourishmentlossmodifier=${NOURISHMENTLOSSMODIFIER}"
PARAMS="${PARAMS}?falldamagemodifier=${FALLDAMAGEMODIFIER}"
PARAMS="${PARAMS} -ini:Engine:[EpicOnlineServices]:DeploymentId=${DEPLOYMENTID}"
PARAMS="${PARAMS} -ini:Engine:[EpicOnlineServices]:DedicatedServerClientId=${CLIENTID}"
PARAMS="${PARAMS} -ini:Engine:[EpicOnlineServices]:DedicatedServerClientSecret=${CLIENTSECRET}"
PARAMS="${PARAMS} -port=${PORT} -NOSTEAM -log"

echo "Starting Smalland server..."
echo "bash SMALLANDServer.sh ${PARAMS}"
exec bash SMALLANDServer.sh ${PARAMS}