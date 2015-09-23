#!/bin/bash

pkg=$1
if [ -z "$pkg" ]; then
  echo "Usage $0 <frontend|backend>"
  exit 1
fi

if [ "$pkg" = "frontend" ]; then
  exit 0
elif [ "$pkg" = "backend" ]; then
  SPECS="spec/app/models/ spec/framework/persistence/memory_spec.rb"
fi

# Install all dependencies locally
bundle install --deployment

# Run unittests
bundle exec rspec \
	--format RspecJunitFormatter \
	--out rspec.xml \
	$SPECS
