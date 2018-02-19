#!/bin/bash

/etc/init.d/php72-fpm stop
rm -r /usr/local/php72
update-rc.d php72-fpm remove
rm /etc/init.d/php72-fpm
rm /usr/bin/php72
