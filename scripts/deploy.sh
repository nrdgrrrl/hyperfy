#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
compose_plugin=${DOCKER_COMPOSE_PLUGIN:-/usr/libexec/docker/cli-plugins/docker-compose}

if [ ! -r "$compose_plugin" ]; then
  echo "Docker Compose plugin not found at $compose_plugin" >&2
  exit 1
fi

docker run --rm --entrypoint /usr/bin/docker-compose \
  -v "$compose_plugin:/usr/bin/docker-compose:ro" \
  -v /srv/hyperfy:/srv/hyperfy:ro \
  -v "$repo_root:$repo_root:ro" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  alpine:3.22 \
  -p hyperfy \
  -f /srv/hyperfy/compose.yaml \
  -f "$repo_root/compose.tailscale.yaml" \
  up -d hyperfy
