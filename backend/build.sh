#!/bin/bash

bundle install --without test development --deployment

fpm -s dir \
	-t deb \
	-n "phonebook-backend" \
	-v $(<VERSION) \
	--after-install debian/postinst.sh \
	--exclude opt/phonebook-backend/.git \
	.=/opt/phonebook-backend
