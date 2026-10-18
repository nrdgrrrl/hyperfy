# Repository Guidelines

## Project Structure & Organization

This repository customizes the Hyperfy instance at `localhost:3001`. It has no app source or test suite yet; `compose.tailscale.yaml` overrides client URLs. Keep code and assets here; use clear folders such as `src/`, `assets/`, and `tests/`. The base Compose file and app source are under `/srv/hyperfy`; live world data is under `/srv/hyperfy/world` and is not source.

## Build, Test, and Development

No build, test, or local development commands are configured yet. Before using a command, check the scripts and instructions added with the relevant code (for example, `npm run` for an npm project). When introducing a toolchain, add reproducible setup and run commands to this guide and the project manifest or build configuration.

## Coding Style & Naming

Follow the conventions of the language and framework introduced by each change. Use descriptive names, keep modules focused, and avoid adding dependencies without a clear need. Use consistent formatting and add a formatter or linter configuration when the codebase adopts one; no formatter, linter, or naming convention is established yet.

## Testing

There is no test framework or coverage requirement in the current repository. Add focused tests alongside new behavior when a test setup is introduced, and document the command contributors should run. For visual Hyperfy changes, include a screenshot or a concise manual verification note in the pull request.

## Commits & Pull Requests

There is no commit history to establish a project-specific convention. Use a short, imperative subject, such as `Add lobby signage`. Commit each completed task that changes repository files, including docs, and push when a usable remote exists unless the user opts out. Pull requests should explain the change, report checks, link related issues, and include screenshots for visual changes.

## Work Log

For every work task, add a dated entry to `WORKLOG.md` describing what changed and why key decisions were made. Put the newest entry first. Include relevant checks performed, or state briefly why checks were not applicable.

## Configuration & Runtime Data

Combine `compose.tailscale.yaml` with `/srv/hyperfy/compose.yaml` when recreating the service; repository changes do not apply automatically. Keep credentials in the private environment file and never commit it or generated world data. The live database and uploaded assets are stored separately under `/srv/hyperfy/world`.
