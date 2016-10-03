#!/bin/bash -x

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

pkg=$1
ver=$2
if [ -z "$pkg" -o -z "$ver" ]; then
  echo "Usage $0 <frontend|backend> <version>"
  exit 1
fi

#gem install fpm

cd $pkg
#rm -rf .bundle vendor coverage *.deb
rm -rf vendor *.deb

# Install all dependencies locally
#bundle install --deployment
bundle install

# Build debian package
fpm -s dir \
	-t deb \
	-n "phonebook-$pkg" \
	-v $ver \
	--after-install debian/postinst.sh \
	--before-remove debian/prerm.sh \
	--exclude opt/phonebook-$pkg/.git \
	--exclude opt/phonebook-$pkg/coverage \
	--exclude opt/phonebook-$pkg/debian \
	.=/opt/phonebook-$pkg \
	./debian/init.d/phonebook-$pkg=/etc/init.d/phonebook-$pkg
