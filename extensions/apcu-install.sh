#!/bin/bash
cd "$(dirname "$0")"

/usr/local/php7/bin/pecl -C /usr/local/php7/etc/pear.conf install apcu-5.1.7
