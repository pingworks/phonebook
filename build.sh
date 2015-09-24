#!/bin/bash

pkg=$1
if [ -z "$pkg" ]; then
  echo "Usage $0 <frontend|backend>"
  exit 1
fi

# Install all dependencies locally
bundle install --deployment

# Build debian package
fpm -s dir \
	-t deb \
	-n "phonebook-$pkg" \
	-v $(<VERSION) \
	--after-install debian/postinst.sh \
	--before-remove debian/prerm.sh \
	--exclude opt/phonebook-$pkg/.git \
	--exclude opt/phonebook-$pkg/coverage \
	--exclude opt/phonebook-$pkg/debian \
	.=/opt/phonebook-$pkg \
	./debian/init.d/phonebook-$pkg=/etc/init.d
