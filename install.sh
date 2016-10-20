#!/bin/bash
cd "$(dirname "$0")"

# Create a dir for storing PHP module conf
mkdir /usr/local/php71/etc/conf.d

# Symlink php-fpm to php71-fpm
ln -s /usr/local/php71/sbin/php-fpm /usr/local/php71/sbin/php71-fpm

# Install PECL
/usr/local/php71/bin/pecl -C /usr/local/php71/etc/pear.conf clear-cache
/usr/local/php71/bin/pecl -C /usr/local/php71/etc/pear.conf update-channels

# Add config files
cp php-src/php.ini-production /usr/local/php71/lib/php.ini
cp conf/www.conf /usr/local/php71/etc/php-fpm.d/www.conf
cp conf/php-fpm.conf /usr/local/php71/etc/php-fpm.conf
cp conf/modules.ini /usr/local/php71/etc/conf.d/modules.ini

# Add the init script
cp conf/php-fpm.init /etc/init.d/php71-fpm
chmod +x /etc/init.d/php71-fpm
update-rc.d php71-fpm defaults

service php71-fpm start

# Add a shortcut
sudo ln -s /usr/local/php71/bin/php /usr/bin/php71
