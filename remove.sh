#!/bin/bash

/etc/init.d/php70-fpm stop
rm -r /usr/local/php70
update-rc.d php70-fpm remove
rm /etc/init.d/php70-fpm
rm /usr/bin/php70
