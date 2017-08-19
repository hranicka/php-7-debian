#!/bin/bash
cd "$(dirname "$0")"

/usr/local/php7/bin/pecl -C /usr/local/php7/etc/pear.conf install ssh2-1.1.2

# Add config files
echo "extension=ssh2.so" | sudo tee -a /usr/local/php70/etc/conf.d/modules.ini
