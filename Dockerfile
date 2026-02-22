FROM cm2network/steamcmd:root AS build_stage

ENV STEAMAPPID 808040
ENV STEAMAPP smalland
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

COPY "scripts/build.sh" "${HOMEDIR}/build.sh"
COPY "scripts/start-server.sh" "${HOMEDIR}/start-server.sh"

RUN set -x \
    && apt-get update \
    && mkdir -p "${STEAMAPPDIR}" \
    && chmod +x "${HOMEDIR}/build.sh" "${HOMEDIR}/start-server.sh" \
    && chown -R "${USER}:${USER}" "${HOMEDIR}" \
    && rm -rf /var/lib/apt/lists/*

FROM build_stage AS bookworm-base

# Switch to user
USER ${USER}

WORKDIR ${HOMEDIR}

CMD ["bash", "build.sh"]