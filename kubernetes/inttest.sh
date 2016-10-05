#!/bin/bash

dir=$1
if [ -z "$dir" -o ! -d "$dir" ]; then
	echo "Usage: $0 <directory>"
fi

# Run integration tests
cd $dir
SPECS="spec/app/api_v1_spec.rb"
bundle exec rspec \
	--format RspecJunitFormatter \
	--out coverage/rspec.xml \
	$SPECS
