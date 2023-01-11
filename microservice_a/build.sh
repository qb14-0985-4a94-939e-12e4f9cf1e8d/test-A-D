#!/bin/bash

# for sure it would be better
# https://docs.docker.com/build/cache/backends/gha/
# but okay

__SVC=$( echo "$PWD" | awk -F '/' '{print $NF}')

# just checking
[[ -z ${PWD} ]] && exit 1
[[ -z $1 ]] && exit 1

echo "building $__SVC"
echo "tag is $1"

docker build \
  --file Dockerfile \
  -t "${__SVC}:${1}" \
  -t "${__SVC}:latest" \
  .

docker images
