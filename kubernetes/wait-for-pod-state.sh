#!/bin/bash

label=$1
state=$2
timeout=$3

if [ -z "$label" -o -z "$state" -o -z "$timeout" ]; then
  echo "Usage $0 <label> <state> <timeout>"
  exit 1
fi
if [ -z "$KUBECTL" ]; then
  KUBECTL="$(which kubectl)"
  if [ -z "$KUBECTL" ]; then
    KUBECTL="${WORKSPACE}/../kube/kubectl"
  fi
fi

i=0
EC=1
until [ $EC -eq 0 -o $i -ge $timeout ]; do
  current_state=$(${KUBECTL} describe pod -l $label | grep "State:" | awk '{print $2}')
  echo "Waiting for pod $label to be $state, current state is: ${current_state}"
  if [ "$current_state" = "$state" ]; then
    EC=0
  else
    EC=1
    if [ "$current_state" = "Terminated" ]; then
      break
    fi
  fi
  ((i++))
  sleep 1
done
[ $EC -eq 0 ] || exit 1
