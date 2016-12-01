#!/bin/bash
cd "$(dirname "$0")"

# Dependencies
sudo apt-get update
sudo apt-get install -y \
    libssh2-1-dev

git clone https://github.com/php/pecl-networking-ssh2.git
cd pecl-networking-ssh2
git checkout master
git pull

/usr/local/php7/bin/phpize
./configure --with-php-config=/usr/local/php7/bin/php-config

make
sudo make install
