#!/bin/bash

set -xe

__SVC=$( echo "$PWD" | awk -F '/' '{print $NF}')

# just checking
[[ -z ${PWD} ]] && exit 1
[[ -z $1 ]] && exit 1

echo "building $__SVC"
echo "tag is $1"

docker build \
  --file Dockerfile \
  -t "ghcr.io/qb14-0985-4a94-939e-12e4f9cf1e8d/test-a-d/${__SVC}:${1}" \
  -t "ghcr.io/qb14-0985-4a94-939e-12e4f9cf1e8d/test-a-d/${__SVC}:latest" \
  -t "${__SVC}:${1}" \
  -t "${__SVC}:latest" \
  .
