#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

pkg=$1
ver=$2
stage=$3
suffix=$4

if [ -z "$pkg" -o -z "$ver" ]; then
  echo "Usage $0 <frontend|backend> <version> [<stage>] [<suffix>]"
  exit 1
fi
if [ -z "$stage" ]; then
  stage="pipeline"
fi
if [ ! -z "$suffix" ]; then
  suffix="-$suffix"
fi
if [ -z "$KUBECTL" ]; then
  KUBECTL="$(which kubectl)"
  if [ -z "$KUBECTL" ]; then
    KUBECTL="${WORKSPACE}/../kube/kubectl"
  fi
fi

${KUBECTL} set image deployment/phonebook-${pkg}${suffix} phonebook-${pkg}=kube-registry.kube-system.svc.cluster.local:5000/phonebook-${pkg}:1git${ver}
