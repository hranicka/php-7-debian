#!/bin/bash
cd "$(dirname "$0")"

# Create a dir for storing PHP module conf
mkdir /usr/local/php7/etc/conf.d

# Symlink php-fpm to php7-fpm
ln -s /usr/local/php7/sbin/php-fpm /usr/local/php7/sbin/php7-fpm

# Install PECL
/usr/local/php7/bin/pecl -C /usr/local/php7/etc/pear.conf clear-cache
/usr/local/php7/bin/pecl -C /usr/local/php7/etc/pear.conf update-channels

/usr/local/php7/bin/pecl -C /usr/local/php7/etc/pear.conf install apcu-5.1.6

# Add config files
cp php-src/php.ini-production /usr/local/php7/lib/php.ini
cp conf/www.conf /usr/local/php7/etc/php-fpm.d/www.conf
cp conf/php-fpm.conf /usr/local/php7/etc/php-fpm.conf
cp conf/modules.ini /usr/local/php7/etc/conf.d/modules.ini

# Add the init script
cp conf/php-fpm.init /etc/init.d/php7-fpm
chmod +x /etc/init.d/php7-fpm
update-rc.d php7-fpm defaults

service php7-fpm start

# Add a shortcut
sudo ln -s /usr/local/php7/bin/php /usr/bin/php7
