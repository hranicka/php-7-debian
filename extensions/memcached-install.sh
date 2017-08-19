#!/bin/bash
cd "$(dirname "$0")"

/usr/local/php7/bin/pecl -C /usr/local/php7/etc/pear.conf install memcached-3.0.3

# Enable the module
echo "extension=memcached.so" | sudo tee -a /usr/local/php71/etc/conf.d/modules.ini
