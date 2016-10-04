#!/bin/bash

${WORKSPACE}/../kube/kubectl run phonebook-build \
  --image=kube-registry.kube-system.svc.cluster.local:5000/ruby-phonebook:a34121390db3 \
  --restart=Never \
  --overrides="$(<kubernetes/build-pod-overrides.json)" 

