# Contributing

This document covers how the image is built and how to work on it locally.

---

## Repository Structure

```
.
├── docker-compose.yml       # Sample compose file for end users
├── Dockerfile               # Image definition (based on cm2network/steamcmd)
└── scripts/
    ├── entrypoint.sh        # Sets ownership and delegates to build.sh
    ├── build.sh             # Downloads/updates server via SteamCMD, then starts it
    └── start-server.sh      # Assembles launch parameters and starts the Unreal Engine server
```

---

## Building the Image Locally

```bash
docker build -t smalland-server .
```

Then update the `image:` line in `docker-compose.yml` to `smalland-server` and run as normal.

---

## How It Works

1. **`entrypoint.sh`** — Runs as root to fix volume ownership, then drops to the `steam` user and calls `build.sh`.
2. **`build.sh`** — Runs SteamCMD to install or update the dedicated server (App ID `808040`), then calls `start-server.sh`.
3. **`start-server.sh`** — Builds the Unreal Engine launch parameter string from environment variables and starts `SMALLANDServer.sh`.

---

## Image Publishing

The image is published to the GitHub Container Registry at:

```
ghcr.io/ryan-singleton/smalland-server:latest
```

Publishing is handled via GitHub Actions on push to `main`.

---

## Reporting Issues

Please open an issue on GitHub with as much detail as possible — Docker version, host OS, relevant log output, and steps to reproduce.

Pull requests are welcome. For significant changes, please open an issue first to discuss the approach.