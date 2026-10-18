#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
compose_plugin=${DOCKER_COMPOSE_PLUGIN:-/usr/libexec/docker/cli-plugins/docker-compose}
branch=$(git -C "$repo_root" branch --show-current)

if [ "$branch" != "production" ]; then
  echo "Deploy from the production branch (currently on $branch)" >&2
  exit 1
fi

if [ -n "$(git -C "$repo_root" status --porcelain)" ]; then
  echo "Refusing to deploy with uncommitted changes" >&2
  exit 1
fi

commit_hash=$(git -C "$repo_root" rev-parse --short=12 HEAD)

if [ ! -r "$compose_plugin" ]; then
  echo "Docker Compose plugin not found at $compose_plugin" >&2
  exit 1
fi

docker run --rm --entrypoint /usr/bin/docker-compose \
  -e "COMMIT_HASH=$commit_hash" \
  -v "$compose_plugin:/usr/bin/docker-compose:ro" \
  -v /srv/hyperfy:/srv/hyperfy:ro \
  -v "$repo_root:$repo_root:ro" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  alpine:3.22 \
  -p hyperfy \
  -f /srv/hyperfy/compose.yaml \
  -f "$repo_root/compose.tailscale.yaml" \
  up -d hyperfy
