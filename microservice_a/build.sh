#!/bin/bash

set -xe

__SVC=$( echo "$PWD" | awk -F '/' '{print $NF}')

# just checking null
[[ -z ${PWD} ]] \
  || [[ -z $1 ]] \
  || [[ -z $IMAGE_PREFIX ]] \
  && exit 1

echo "building $__SVC with tag $1"

# my docker and docker on github actions runner does not work with --link option
# but I still want to use symlinks
# so, I will just leave those files symlinks and add making hardlinks from symlinks
# when running pipeline

find ./ -type l -exec sh -c 'ln -fn $(readlink "{}") "{}"' \;

docker build \
  --file Dockerfile \
  -t "${IMAGE_PREFIX}/${__SVC}:${1}" \
  -t "${IMAGE_PREFIX}/${__SVC}:latest" \
  .
