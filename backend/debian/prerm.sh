#!/bin/bash

# kill running ruby app
pid=$(ps xa \
	| grep 'ruby2.1 /opt/phonebook-backend/vendor/bundle/ruby/2.1.0/bin/rackup' \
	| grep -v grep \
	| awk '{print $1}')
kill $pid

