#!/bin/bash
cd "$(dirname "$0")"

# Dependencies
sudo apt-get update
sudo apt-get install -y \
    imagemagick \
    libmagickwand-dev

git clone https://github.com/mkoppanen/imagick.git
cd imagick
git checkout phpseven
git pull

/usr/local/php72/bin/phpize
./configure --with-php-config=/usr/local/php72/bin/php-config

make
sudo make install
