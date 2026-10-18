# Repository Guidelines

## Project Structure & Organization

This repository is the workspace for customizations to the Hyperfy instance at `localhost:3001`. It currently contains no application source, assets, tests, or deployment files. Keep new project code and customization assets in this repository. As the project grows, use clear top-level folders such as `src/`, `assets/`, and `tests/`, and document any new structure here. The live server currently runs from a Docker image; its world database and uploaded assets are stored separately under `/srv/hyperfy/world`. Do not treat that runtime data directory as the source tree.

## Build, Test, and Development

No build, test, or local development commands are configured yet. Before using a command, check the scripts and instructions added with the relevant code (for example, `npm run` for an npm project). When introducing a toolchain, add reproducible setup and run commands to this guide and the project manifest or build configuration.

## Coding Style & Naming

Follow the conventions of the language and framework introduced by each change. Use descriptive names, keep modules focused, and avoid adding dependencies without a clear need. Use consistent formatting and add a formatter or linter configuration when the codebase adopts one; no formatter, linter, or naming convention is established yet.

## Testing

There is no test framework or coverage requirement in the current repository. Add focused tests alongside new behavior when a test setup is introduced, and document the command contributors should run. For visual Hyperfy changes, include a screenshot or a concise manual verification note in the pull request.

## Commits & Pull Requests

There is no commit history to establish a project-specific convention. Use a short, imperative commit subject that describes one scoped change, such as `Add lobby signage`. Create a meaningful commit for each completed task that changes repository files, including documentation, and push it when a usable remote is configured unless the user opts out. Pull requests should explain the change, include relevant verification results, link related issues when available, and provide screenshots for visual changes.

## Work Log

For every work task, add a dated entry to `WORKLOG.md` describing what changed and why key decisions were made. Put the newest entry first. Include relevant checks performed, or state briefly why checks were not applicable.

## Configuration & Runtime Data

Never commit credentials, private environment files, or generated production world data. Keep configuration examples free of secrets. Changes in this repository do not automatically update the running Docker instance; follow the deployment setup documented here once it is added.
