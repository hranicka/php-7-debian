#!/bin/bash
cd "$(dirname "$0")"

/usr/local/php7/bin/pecl -C /usr/local/php7/etc/pear.conf install redis-3.1.3

# Enable the module
echo "extension=redis.so" | sudo tee -a /usr/local/php70/etc/conf.d/modules.ini
