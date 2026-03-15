FROM cm2network/steamcmd:root

ENV STEAMAPPID=808040
ENV STEAMAPP=smalland
ENV STEAMAPPDIR="${HOMEDIR}/${STEAMAPP}-dedicated"

COPY "scripts/entrypoint.sh" "${HOMEDIR}/entrypoint.sh"
COPY "scripts/build.sh" "${HOMEDIR}/build.sh"
COPY "scripts/start-server.sh" "${HOMEDIR}/start-server.sh"

RUN set -x \
    && mkdir -p "${STEAMAPPDIR}" \
    && chmod +x "${HOMEDIR}/entrypoint.sh" \
    && chmod +x "${HOMEDIR}/build.sh" \
    && chmod +x "${HOMEDIR}/start-server.sh" \
    && chown -R "${USER}:${USER}" "${HOMEDIR}" "${STEAMAPPDIR}"

USER root
WORKDIR ${HOMEDIR}
CMD ["bash", "entrypoint.sh"]