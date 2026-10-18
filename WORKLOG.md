# Work Log

This log records repository work, its outcomes, and the reasoning behind key decisions. New entries go first.

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
