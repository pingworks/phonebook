#!/bin/bash

# Cleanup
rm -rf .bundle vendor *.deb

# Install all dependencies locally
bundle install --deployment

# Run unittests
bundle exec rspec \
	--format RspecJunitFormatter \
	--out rspec.xml 
