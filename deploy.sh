#!/bin/bash

source ./.env

docker run --rm -it \
  -v ".:/workspace" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e IMAGE_TAG="$IMAGE_TAG" \
  -e PUBLISH_TAG="$PUBLISH_TAG" \
  -e DOCKER_REGISTRY_URL="$DOCKER_REGISTRY_URL" \
  -e DOCKER_REGISTRY_NAME="lsapp" \
  -e DOCKER_IMAGE_NAME="php" \
  -e DOCKER_REGISTRY_USERNAME="$REGISTRY_USERNAME" \
  -e DOCKER_REGISTRY_PASSWORD="$REGISTRY_PASSWORD" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ghcr.io/lsapp/ansible-docker:latest \
  ansible-playbook build_and_push.yml
