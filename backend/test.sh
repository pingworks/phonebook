#!/bin/bash
set -e
bundle install --path vendor/bundle
# it might even be a good idea to do a
# sudo bundle install
# here. Doing it this way the gems will be "cached" on the test/build environments which will speed up subsequent test runs
# significantly.
# but we're still not trusting the ruby gem world enough ;-)

bundle exec rspec
