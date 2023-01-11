#!/bin/bash

set -xe

__SVC=$( echo "$PWD" | awk -F '/' '{print $NF}')

# just checking null
[[ -z ${PWD} ]] \
  || [[ -z $1 ]] \
  || [[ -z $IMAGE_PREFIX ]] \
  && exit 1

echo "building $__SVC with tag $1"

docker build \
  --file Dockerfile \
  -t "${IMAGE_PREFIX}/${__SVC}:${1}" \
  -t "${IMAGE_PREFIX}/${__SVC}:latest" \
  .
