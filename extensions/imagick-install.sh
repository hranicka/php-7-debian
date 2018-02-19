#!/bin/bash

# Add config files
echo "extension=imagick.so" | sudo tee -a /usr/local/php72/etc/conf.d/modules.ini
