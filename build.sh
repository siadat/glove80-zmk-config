#!/bin/bash

set -euo pipefail

export DOCKER_BUILDKIT=1
IMAGE=glove80-zmk-config-docker
BRANCH="${1:-main}"

# Latest working version:
#
#     bash build.sh v24.08-beta.1
#
docker build -t "$IMAGE" .
docker run -it --rm -v "$PWD:/config" -e UID="$(id -u)" -e GID="$(id -g)" -e BRANCH="$BRANCH" "$IMAGE"
