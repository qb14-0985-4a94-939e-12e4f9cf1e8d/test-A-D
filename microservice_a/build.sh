#!/bin/bash

__SVC=$( echo "$PWD" | awk -F '/' '{print $NF}')

# just checking
[[ -z ${PWD} ]] && exit 1
[[ -z $1 ]] && exit 1

echo "building $__SVC"
echo "tag is $1"
