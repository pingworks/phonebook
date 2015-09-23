#!/bin/bash

pkg=$1
if [ -z "$pkg" ]; then
  echo "Usage $0 <frontend|backend>"
  exit 1
fi

# Cleanup
rm -rf .bundle vendor *.deb

# Install all dependencies locally
bundle install --without test development --deployment

# Build debian package
fpm -s dir \
	-t deb \
	-n "phonebook-$pkg" \
	-v $(<VERSION) \
	--after-install debian/postinst.sh \
	--exclude opt/phonebook-$pkg/.git \
	.=/opt/phonebook-$pkg
