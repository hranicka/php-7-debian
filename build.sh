#!/bin/bash
cd "$(dirname "$0")"

# Use all cores for the build process
CORE_COUNT=$(cat /proc/cpuinfo | grep -c processor)

# Allow JOB_COUNT environment variable to override the job count
JOB_COUNT=${JOB_COUNT:-$CORE_COUNT}

# Dependencies
sudo apt-get update
sudo apt-get install -y \
    build-essential \
    pkg-config \
    git-core \
    autoconf \
    bison \
    libxml2-dev \
    libbz2-dev \
    libmcrypt-dev \
    libicu-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libcurl4-gnutls-dev \
    libltdl-dev \
    libjpeg-dev \
    libpng-dev \
    libpspell-dev \
    libreadline-dev

# curl fix (https://github.com/phpbrew/phpbrew/issues/861)
ln -s /usr/include/x86_64-linux-gnu/curl /usr/local/include/curl

sudo mkdir /usr/local/php72

git clone https://github.com/php/php-src.git
cd php-src
git fetch --tags --prune
git checkout tags/php-7.2.2
./buildconf --force

CONFIGURE_STRING="--prefix=/usr/local/php72 \
                  --enable-huge-code-pages \
                  --with-config-file-scan-dir=/usr/local/php72/etc/conf.d \
                  --with-pear \
                  --enable-bcmath \
                  --with-bz2 \
                  --enable-calendar \
                  --enable-intl \
                  --enable-exif \
                  --enable-dba \
                  --enable-ftp \
                  --with-gettext \
                  --with-gd \
                  --with-jpeg-dir \
                  --enable-mbstring \
                  --with-mcrypt \
                  --with-mhash \
                  --enable-mysqlnd \
                  --with-mysql=mysqlnd \
                  --with-mysql-sock=/var/run/mysqld/mysqld.sock \
                  --with-mysqli=mysqlnd \
                  --with-pdo-mysql=mysqlnd \
                  --with-openssl \
                  --enable-pcntl \
                  --with-pspell \
                  --enable-shmop \
                  --enable-soap \
                  --enable-sockets \
                  --enable-sysvmsg \
                  --enable-sysvsem \
                  --enable-sysvshm \
                  --enable-wddx \
                  --with-zlib \
                  --enable-zip \
                  --with-readline \
                  --with-curl \
                  --enable-fpm \
                  --with-fpm-user=www-data \
                  --with-fpm-group=www-data"

./configure "$CONFIGURE_STRING"

make -j "$JOB_COUNT"
sudo make install
