#!/bin/bash

name=$1
img=$2
cmd=$3

if [ -z "$name" -o -z "$img" -o -z "$cmd" ]; then
  echo "Usage $0 <name> <image> <cmd>"
  exit 1
fi
if [ -z "$KUBECTL" ]; then
  KUBECTL="$(which kubectl)"
  if [ -z "$KUBECTL" ]; then
    KUBECTL="${WORKSPACE}/../kube/kubectl"
  fi
fi

function join_by { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }
cmdstring='[ "'$(join_by '", "' $cmd)'" ]'

${KUBECTL} run $name \
  --image=kube-registry.kube-system.svc.cluster.local:5000/${img} \
  --restart=Never \
  --overrides="$(sed -e "s;__NAME__;$name;g" \
	-e "s;__IMAGE__;$img;g" \
	-e "s;__CMD__;$cmdstring;g" \
	kubernetes/kubernetes-run-overrides.json)"

echo
bash $(dirname $0)/wait-for-pod-state.sh "app=${name}" Running 30

echo "Reading logs from pod $name:"
echo
${KUBECTL} logs -f $name
