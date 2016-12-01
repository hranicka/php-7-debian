#!/bin/bash

# Add config files
echo "extension=ssh2.so" | sudo tee -a /usr/local/php7/etc/conf.d/modules.ini
