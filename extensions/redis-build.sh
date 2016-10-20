#!/bin/bash
cd "$(dirname "$0")"

# Dependencies
sudo apt-get update
sudo apt-get install -y \
    redis-server

git clone https://github.com/phpredis/phpredis.git
cd phpredis
git checkout php7
git pull

/usr/local/php71/bin/phpize
./configure --with-php-config=/usr/local/php71/bin/php-config

make
sudo make install
