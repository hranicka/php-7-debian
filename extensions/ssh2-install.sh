#!/bin/bash

# Add config files
echo "extension=ssh2.so" | sudo tee -a /usr/local/php70/etc/conf.d/modules.ini
