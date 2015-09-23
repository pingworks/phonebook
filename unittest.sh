#!/bin/bash

# Cleanup
rm -rf .bundle vendor *.deb

# Install all dependencies locally
bundle install --deployment

# Run unittests
bundle exec rspec \
	--format RspecJunitFormatter \
	--out rspec.xml \
	spec/app/models/ \
	spec/framework/persistence/memory_spec.rb
