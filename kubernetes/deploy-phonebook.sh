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

sed -e "s;__IMG_VERSION__;1git$ver;" \
  -e "s;__STAGE__;$stage;g" \
  -e "s;__SUFFIX__;$suffix;g" \
  yamls/deployment-phonebook-${pkg}.yaml \
  | kubectl create -f -
sed -e "s;__IMG_VERSION__;1git$ver;" \
  -e "s;__STAGE__;$stage;g" \
  -e "s;__SUFFIX__;$suffix;g" \
  yamls/service-phonebook-${pkg}.yaml \
  | kubectl create -f -
