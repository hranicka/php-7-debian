#!/bin/bash

# Enable the module
echo "extension=memcached.so" | sudo tee -a /usr/local/php70/etc/conf.d/modules.ini
