#!/bin/bash

bundle install --without test development --deployment

fpm -s dir \
	-t deb \
	-n "phonebook-frontend" \
	-v $(<VERSION) \
	--after-install debian/postinst.sh \
	--exclude opt/phonebook-frontend/.git \
	.=/opt/phonebook-frontend
