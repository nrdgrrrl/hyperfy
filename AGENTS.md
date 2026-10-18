# Repository Guidelines

## Project Structure

This repository is a fork of [Hyperfy](https://github.com/hyperfy-xyz/hyperfy), with project-specific changes kept in the source tree. Client and server code live in `src/client/` and `src/server/`; shared runtime code is in `src/core/`; world defaults and bundled assets are in `src/world/`. `compose.tailscale.yaml` configures this host's LAN and Tailscale deployment, and `scripts/deploy.sh` deploys it. Live world data and private configuration remain under `/srv/hyperfy`, outside Git.

## Development and Deployment

Use Node.js 22.11+ and npm 10+. Run `npm ci` to install locked dependencies, `npm run dev` for development, `npm run build` to create production assets, and `npm run lint` for ESLint. The repository has no dedicated test suite. `./scripts/deploy.sh` builds and deploys the current commit; it only runs from a clean `production` branch and requires Docker plus the existing `/srv/hyperfy` configuration.

## Code and Tests

Follow the surrounding Hyperfy code style: two-space indentation, semicolons omitted, single quotes in JavaScript, and descriptive camelCase names. Keep changes focused and avoid formatting unrelated upstream files. There is no test framework or coverage threshold; run the relevant build or lint command for code changes and record manual checks for runtime behavior in the work log.

## Git and Release Workflow

`origin` is the personal fork at `nrdgrrrl/hyperfy`; `upstream` is `hyperfy-xyz/hyperfy` and is fetch-only. Never push to `upstream`. Do feature work on `feature/<short-name>` branches from `main`, then review and merge it to `main`. Fetch upstream changes with `git fetch upstream` and merge them into `main` deliberately. Push completed work to `origin`.

`production` is the only deployment branch. Promote reviewed `main` changes into it with a fast-forward merge, push `production` to `origin`, then run `./scripts/deploy.sh` from that clean branch. This keeps the deployed commit visible and reproducible. Use short imperative commit subjects (for example, `Derive WebSocket URL from browser origin`). Pull requests should describe behavior and checks; include screenshots for visual changes.

## Configuration and Work Log

Never commit secrets, `.env` files, or generated live world data. Keep runtime configuration and the persistent database/assets under `/srv/hyperfy/world`. Add a dated, newest-first entry to `WORKLOG.md` for each work task, including changes, the reasons behind key decisions, and checks performed.
