#!/bin/bash

__SVC=$( echo "$PWD" | awk -F '/' '{print $NF}')

[[ -z ${PWD} ]] && exit # just checking

echo "building $__SVC"
