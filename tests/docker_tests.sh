#!/usr/bin/env bash

DOCKER_IMAGE="dockerframework/terraform"
DOCKER_TAG="0.10"

#### Halt script on error
set -e

echo '##### Print docker version'
docker --version

echo '##### Print environment'
env | sort

echo "FROM ${DOCKER_IMAGE}:${DOCKER_TAG}" > Dockerfile.test &&
docker build --no-cache -t "${DOCKER_IMAGE}:${DOCKER_TAG}-test" -f Dockerfile.test . &&
docker run -it -d "${DOCKER_IMAGE}:${DOCKER_TAG}-test" /bin/bash &&
docker ps -a
rm Dockerfile.test
