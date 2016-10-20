#!/bin/bash

/etc/init.d/php71-fpm stop
rm -r /usr/local/php71
update-rc.d php71-fpm remove
rm /etc/init.d/php71-fpm
rm /usr/bin/php71
