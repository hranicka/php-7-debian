#!/bin/bash
cd "$(dirname "$0")"

# Create a dir for storing PHP module conf
mkdir /usr/local/php72/etc/conf.d

# Symlink php-fpm to php72-fpm
ln -s /usr/local/php72/sbin/php-fpm /usr/local/php72/sbin/php72-fpm

# Install PECL
/usr/local/php72/bin/pecl -C /usr/local/php72/etc/pear.conf clear-cache
/usr/local/php72/bin/pecl -C /usr/local/php72/etc/pear.conf update-channels

# Add config files
cp php-src/php.ini-production /usr/local/php72/lib/php.ini
cp conf/www.conf /usr/local/php72/etc/php-fpm.d/www.conf
cp conf/php-fpm.conf /usr/local/php72/etc/php-fpm.conf
cp conf/modules.ini /usr/local/php72/etc/conf.d/modules.ini

# Add the init script
cp conf/php-fpm.init /etc/init.d/php72-fpm
chmod +x /etc/init.d/php72-fpm
update-rc.d php72-fpm defaults

service php72-fpm start

# Add a shortcut
sudo ln -s /usr/local/php72/bin/php /usr/bin/php72
