#!/bin/bash
cd "$(dirname "$0")"

/usr/local/php70/bin/pecl -C /usr/local/php70/etc/pear.conf install apcu-5.1.7

# Add config files
echo "extension=apcu.so" | sudo tee -a /usr/local/php70/etc/conf.d/modules.ini
