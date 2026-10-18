# Work Log

This log records repository work, its outcomes, and the reasoning behind key decisions. New entries go first.

## 2026-10-18 — Fork upstream and define release workflow

- Created the personal fork `nrdgrrrl/hyperfy`, configured `origin` for that fork and `upstream` for `hyperfy-xyz/hyperfy`, and integrated upstream `main` into the repository's `main` branch.
- Moved the LAN/Tailscale WebSocket origin logic into `src/server/index.js`, so the browser connects to the host and protocol it used. Restored upstream's standard `Dockerfile`; the deployment override now builds this source tree and tags the image as `hyperfy-metaverse:production`.
- Updated `scripts/deploy.sh` to deploy only a clean `production` branch and pass its commit hash into the build. Documented feature -> `main` -> `production`, fork push, and upstream fetch/merge practices in `AGENTS.md`.
- Enabled Issues on the personal fork and opened [issue #1](https://github.com/nrdgrrrl/hyperfy/issues/1) for model uploads failing when `crypto.subtle.digest` is unavailable on HTTP origins.
- Decision: keep upstream as a fetch-only remote, use `main` for reviewed development, and make `production` the explicit deploy target. This gives the running service a traceable commit while retaining normal upstream updates.
- Checks: GitHub fork created and source merge resolved; `sh -n scripts/deploy.sh` and the scoped `git diff --check` pass. Runtime deployment is restricted to a clean `production` commit and embeds its commit hash.
- Runtime check: deployed source commit `60e3c87`; the container became healthy, `/health` returned 200, LAN and Tailscale origins produced their own WebSocket URLs, and both WebSocket handshakes returned 101.

## 2026-10-18 — Preserve local LAN and Tailscale access

- Replaced the fixed Tailscale URLs with relative API and asset paths plus a WebSocket URL derived from the browser's host and protocol. Added a derived image patch in `Dockerfile` and `scripts/patch-hyperfy-env.js`, and a `scripts/deploy.sh` command that combines the repository override with the protected base Compose config.
- Decision: derive endpoints from the address each browser used so LAN clients stay on the LAN address and Tailscale clients stay on the tailnet. Kept the private environment file and world data outside this repository.
- Checks: shell syntax and merged Compose config passed; deployment rebuilt and restarted the service. Evaluated `/env.js` for LAN, Tailscale, and HTTPS origins; health and sample asset requests returned 200 and WebSocket handshakes returned 101 via both LAN and Tailscale addresses.

## 2026-10-18 — Fix Hyperfy client URLs for Tailscale

- Added `compose.tailscale.yaml` to point the browser's API, WebSocket, and asset URLs at `wintermute.taileb49eb.ts.net:3001`, documented its use in `AGENTS.md`, and recreated the Hyperfy service with the override.
- Decision: all three URLs had to change because the HTML metadata and world snapshot also use `ASSETS_BASE_URL`. Kept the base Compose file and its private environment file outside this repository; the override contains no credentials. The initial `authToken=null` is the normal first connection, after which the server issues a token.
- Checks: validated the merged Compose config; confirmed `/health` returns `ok`, `/env.js` advertises the Tailscale URLs, the WebSocket upgrade returns `101 Switching Protocols`, and a world GLB asset returns HTTP 200 through the Tailscale hostname.

## 2026-10-18 — Start the work log

- Added this log and updated `AGENTS.md` to require a dated entry for each work task, including decisions and relevant checks.
- Extended the commit guidance to cover documentation changes, matching the request to keep work logged alongside regular commits.
- Confirmed the repository has no configured remote. The documentation changes will be committed locally; there is no destination to push to.
- Checks: verified `WORKLOG.md` did not exist before creating it and reviewed repository status and remotes.

## 2026-10-18 — Add contributor guidance

- Created `AGENTS.md` with repository structure, development and testing status, style guidance, commit expectations, and runtime data handling.
- Decisions: described the current empty workspace and absent toolchain directly instead of inventing commands or conventions; documented the boundary between this repository and the live Hyperfy data directory.
- Checks: verified no `AGENTS.md` existed before creation and reviewed the completed document.

## 2026-10-18 — Familiarize with the Hyperfy instance

- Inspected the project folder and the service on port 3001. Found Hyperfy v0.16.0 running in Docker, with the world database and assets persisted under `/srv/hyperfy/world` and mounted into the container.
- Decisions: made no runtime changes because the request was to become familiar with the instance. Identified this repository as the intended home for future customizations; the running app source is not currently in it.
- Checks: confirmed the home page responds and `/health` returns `ok`; inspected Docker image, port, Compose metadata, and world mount details.
