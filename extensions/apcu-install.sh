#!/bin/bash
cd "$(dirname "$0")"

/usr/local/php72/bin/pecl -C /usr/local/php72/etc/pear.conf install apcu-5.1.10

# Add config files
echo "extension=apcu.so" | sudo tee -a /usr/local/php72/etc/conf.d/modules.ini
