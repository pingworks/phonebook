#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

pkg=$1
stage=$2
suffix=$3

if [ -z "$pkg" ]; then
  echo "Usage $0 <frontend|backend> [<stage>] [<suffix>]"
  exit 1
fi
if [ -z "$stage" ]; then
  stage="pipeline"
fi
if [ ! -z "$suffix" ]; then
  suffix="-$suffix"
fi

kubectl delete deployment phonebook-${pkg}${suffix}
kubectl delete service phonebook-${pkg}${suffix}