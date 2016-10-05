#!/bin/bash

# Run integration tests
bundle exec rspec \
	--format RspecJunitFormatter \
	--out coverage/rspec.xml
