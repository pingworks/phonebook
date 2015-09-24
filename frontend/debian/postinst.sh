#!/bin/bash

# TODO
# create startscript for rack server

# cd /opt/phonebook-frontend
# nohup bundle exec rackup config.ru &

# change ownership of config.js
if id deploy >/dev/null 2>&1; then
  chown deploy:deploy /opt/phonebook-frontend/assets/javascript/config.js
  sed -e "s;__DOMAIN__;$(dnsdomain);g" /opt/phonebook-frontend/assets/javascript/config.js
fi

