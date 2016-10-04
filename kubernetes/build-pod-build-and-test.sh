#!/bin/bash

pkg=$1
ver=$2
if [ -z "$pkg" -o -z "$ver" ]; then
  echo "Usage $0 <frontend|backend> <version>"
  exit 1
fi


${WORKSPACE}/../kube/kubectl run phonebook-build \
  --image=kube-registry.kube-system.svc.cluster.local:5000/ruby-phonebook:a34121390db3 \
  --restart=Never \
  --overrides="$(sed -e "s;__PKG__;$pkg;g" \
	-e "s;__VERSION__;$ver;g' \
	kubernetes/build-pod-overrides.json)

