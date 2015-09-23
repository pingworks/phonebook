#!/bin/bash

# Install all dependencies locally
bundle install --deployment

# Run unittests
bundle exec rspec \
	--format RspecJunitFormatter \
	--out rspec.xml 
