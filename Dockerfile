FROM cm2network/steamcmd:latest

ENV STEAMAPPID=808040 \
    STEAMAPPDIR=/home/steam/smalland-dedicated \
    # Server defaults
    SERVERNAME="Smalland Server" \
    WORLDNAME="World" \
    PASSWORD="" \
    PORT=7784 \
    FRIENDLYFIRE=0 \
    PEACEFULMODE=0 \
    KEEPINVENTORY=0 \
    NODETERIORATION=0 \
    PRIVATE=0 \
    LENGTHOFDAYSECONDS=1800 \
    LENGTHOFSEASONSECONDS=10800 \
    CREATUREHEALTHMODIFIER=100 \
    CREATUREDAMAGEMODIFIER=100 \
    NOURISHMENTLOSSMODIFIER=100 \
    FALLDAMAGEMODIFIER=100

RUN mkdir -p /home/steam/smalland-dedicated \
    && chown -R steam:steam /home/steam/smalland-dedicated

COPY --chown=steam:steam scripts/ /home/steam/scripts/
RUN chmod +x /home/steam/scripts/*.sh

USER steam
WORKDIR /home/steam

ENTRYPOINT ["/bin/bash", "/home/steam/scripts/entry.sh"]