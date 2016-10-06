#!/bin/bash

label=$1
status=$2
timeout=$3

if [ -z "$label" -o -z "$status" -o -z "$timeout" ]; then
  echo "Usage $0 <label> <status> <timeout>"
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
  current_status=$(${KUBECTL} describe pod -l $label | grep "Status:" | awk '{print $2}')
  echo "Waiting for pod $label to be $status, current status is: ${current_status}"
  if [ "$current_status" = "$status" ]; then
    EC=0
  else
    EC=1
  fi
  echo "EC:$EC"
  ((i++))
  sleep 1
done
[ $EC -eq 0 ] || exit 1
