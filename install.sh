#!/bin/bash
cd "$(dirname "$0")"

# Create a dir for storing PHP module conf
mkdir /usr/local/php70/etc/conf.d

# Symlink php-fpm to php70-fpm
ln -s /usr/local/php70/sbin/php-fpm /usr/local/php70/sbin/php70-fpm

# Install PECL
/usr/local/php70/bin/pecl -C /usr/local/php70/etc/pear.conf clear-cache
/usr/local/php70/bin/pecl -C /usr/local/php70/etc/pear.conf update-channels

# Add config files
cp php-src/php.ini-production /usr/local/php70/lib/php.ini
cp conf/www.conf /usr/local/php70/etc/php-fpm.d/www.conf
cp conf/php-fpm.conf /usr/local/php70/etc/php-fpm.conf
cp conf/modules.ini /usr/local/php70/etc/conf.d/modules.ini

# Add the init script
cp conf/php-fpm.init /etc/init.d/php70-fpm
chmod +x /etc/init.d/php70-fpm
update-rc.d php70-fpm defaults

service php70-fpm start

# Add a shortcut
sudo ln -s /usr/local/php70/bin/php /usr/bin/php70
