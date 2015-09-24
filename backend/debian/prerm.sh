#!/bin/bash

# kill running ruby app
[ -x /etc/init.d/phonebook-backend ] && /etc/init.d/phonebook-backend stop

