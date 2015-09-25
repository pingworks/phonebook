#!/bin/bash

DIR=$(dirname $0)
PKGS=$1

if [ -z "$PKGS" ]; then
  echo "Usage: $0 <pkgs>"
  exit 1
fi

set -e

cd ${DIR}
for pkg in $PKGS; do
  sudo dpkg -i ${pkg}_*.deb
done
