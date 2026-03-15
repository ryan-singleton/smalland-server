# 🪲 Smalland: Survive the Wild — Dedicated Server (Docker)

A maintained Docker image for running a **Smalland: Survive the Wild** dedicated server on Linux.

*Derived from [MrMightyNighty/smalland-docker](https://github.com/MrMightyNighty/smalland-docker).*

---

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- UDP/TCP ports `7777` and `7778` open on your firewall/router
    - You may customize these ports, just make sure to replace them as needed.

---

## Running the Server

On first start, the server will automatically download the latest Smalland dedicated server files via SteamCMD. This may take a few minutes.

### Option 1 — Docker Compose (recommended)

Download the sample [`docker-compose.yml`](docker-compose.yml) from this repository, edit it to your liking, then run:

```bash
docker compose up smalland -d
```

To follow the logs:

```bash
docker compose logs smalland -f
```

To stop the server:

```bash
docker compose down smalland
```

### Option 2 — Docker Run

```bash
docker run -d \
  --name smalland-server \
  --restart unless-stopped \
  --network host \
  -v ./gamedata/smalland:/home/steam/smalland-dedicated \
  -e SERVERNAME="My Server" \
  -e WORLDNAME="World" \
  -e PASSWORD="changeme" \
  -e PORT=7777 \
  -e FRIENDLYFIRE=0 \
  -e PEACEFULMODE=0 \
  -e KEEPINVENTORY=0 \
  -e NODETERIORATION=0 \
  -e PRIVATE=0 \
  -e LENGTHOFDAYSECONDS=1800 \
  -e LENGTHOFSEASONSECONDS=10800 \
  -e CREATUREHEALTHMODIFIER=100 \
  -e CREATUREDAMAGEMODIFIER=100 \
  -e NOURISHMENTLOSSMODIFIER=100 \
  -e FALLDAMAGEMODIFIER=100 \
  ghcr.io/ryan-singleton/smalland-server:latest
```

---

## Configuration

| Variable | Default | Description |
|---|---|---|
| `SERVERNAME` | `Linux Docker Server` | Name displayed in the server browser |
| `WORLDNAME` | `World` | World/save file name |
| `PASSWORD` | *(empty)* | Server password. |
| `PORT` | `7777` | Primary server port |
| `FRIENDLYFIRE` | `0` | Enable PVP / friendly fire (`0` or `1`) |
| `PEACEFULMODE` | `0` | Enable peaceful mode — no creature attacks (`0` or `1`) |
| `KEEPINVENTORY` | `0` | Keep inventory on death (`0` or `1`) |
| `NODETERIORATION` | `0` | Disable weather-based building deterioration (`0` or `1`) |
| `PRIVATE` | `0` | Hide server from the public browser (`0` or `1`) |
| `LENGTHOFDAYSECONDS` | `1800` | Length of in-game day in seconds (default: 30 min) |
| `LENGTHOFSEASONSECONDS` | `10800` | Length of in-game season in seconds (default: 3 hrs) |
| `CREATUREHEALTHMODIFIER` | `100` | Creature health multiplier (`20`–`300`) |
| `CREATUREDAMAGEMODIFIER` | `100` | Creature damage multiplier (`20`–`300`) |
| `NOURISHMENTLOSSMODIFIER` | `100` | Hunger drain rate (`0`–`100`) |
| `FALLDAMAGEMODIFIER` | `100` | Fall damage multiplier (`50`–`100`) |

---

## Save Data

World saves are stored in `./gamedata/smalland/` (or whatever you chose to bind to on the host) on your host machine. This directory persists across container restarts and image updates. **Back it up regularly.**

---

## Updating

To pull the latest image and restart:

```bash
docker compose pull ghcr.io/ryan-singleton/smalland-server:latest && docker compose up smalland -d
```

SteamCMD will validate and update the server files automatically on startup.

---

## Port Forwarding

| Port | Protocol | Purpose |
|---|---|---|
| `7777` | UDP + TCP | Primary game traffic |
| `7778` | UDP + TCP | Steam/EOS query port |

---

## Contributing

See [CONTRIBUTING.md](docs/CONTRIBUTING.md).