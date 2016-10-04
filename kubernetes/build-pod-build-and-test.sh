#!/bin/bash

pkg=$1
ver=$2
if [ -z "$pkg" -o -z "$ver" ]; then
  echo "Usage $0 <frontend|backend> <version>"
  exit 1
fi


${WORKSPACE}/../kube/kubectl run phonebook-${pkg}-build \
  --image=kube-registry.kube-system.svc.cluster.local:5000/ruby-phonebook:7aae9dd71c19 \
  --restart=Never \
  --overrides="$(sed -e "s;__PKG__;$pkg;g" \
	-e "s;__VERSION__;$ver;g" \
	-e "s;__JOBNAME__;$JOB_BASE_NAME;g" \
	kubernetes/build-pod-overrides.json)"

