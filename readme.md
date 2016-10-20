# Install PHP 7 on Debian/Ubuntu

These are a set of bash scripts for building and running PHP 7 (CLI and FPM) on Debian based Linux distributions:

- `build.sh` installs the necessary build dependencies and the latest development version of PHP with CLI and FPM server APIs (SAPI) from the latest PHP 7 branch of https://github.com/php/php-src

- `install.sh` sets up PHP-FPM by moving configuration files into their correct locations in `/usr/local/php7` and enables the `php7-fpm` service and adds it to the startup sequence.

Please note that these are very simple scripts that don't implement error checking or process validation.

## Usage

	cd /tmp
	git clone https://github.com/hranicka/php-7-debian.git
	cd php-7-debian
	./build.sh

### Install

	sudo ./install.sh

### Update only

	sudo ./update.sh

## About installation

The PHP-FPM can be operated using the `php7-fpm` init script:

	Usage: /etc/init.d/php7-fpm {start|stop|status|restart|reload|force-reload}

While the FPM socket is available at:

	127.0.0.1:9007

And PHP CLI:

	/usr/local/php7/bin/php -v
	PHP 7.0.12 (cli) (built: Jun 23 2016 20:58:06) ( NTS )
	Copyright (c) 1997-2016 The PHP Group
	Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
		with Zend OPcache v7.0.12, Copyright (c) 1999-2016, by Zend Technologies

Executables are located at:

	/usr/local/php7/bin/php
	/usr/bin/php7

## Configuration files

All PHP configuration files are stored under `/usr/local/php7`:

	/usr/local/php7/lib/php.ini
	/usr/local/php7/etc/php-fpm.conf
	/usr/local/php7/etc/php-fpm.d/www.conf
	/usr/local/php7/etc/conf.d/modules.ini

while the Debian init script is added to:

	/etc/init.d/php7-fpm

## Extensions

Note that most of the third-party PHP extensions are [not yet compatible with PHP 7](https://github.com/gophp7/gophp7-ext/wiki/extensions-catalog) and [GoPHP7-ext](http://gophp7.org/) (also on [GitHub](https://github.com/gophp7/gophp7-ext)) is a project to help do that. Here is a list of PHP modules that are enabled by default in this build:

	$ /usr/local/php7/bin/php -m
	[PHP Modules]
	bcmath
	bz2
	calendar
	Core
	ctype
	curl
	date
	dba
	dom
	exif
	fileinfo
	filter
	ftp
	gd
	gettext
	hash
	iconv
	intl
	json
	libxml
	mbstring
	mcrypt
	mhash
	mysqli
	mysqlnd
	openssl
	pcntl
	pcre
	PDO
	pdo_mysql
	pdo_sqlite
	Phar
	posix
	pspell
	readline
	Reflection
	session
	shmop
	SimpleXML
	soap
	sockets
	SPL
	sqlite3
	standard
	sysvmsg
	sysvsem
	sysvshm
	tokenizer
	wddx
	xml
	xmlreader
	xmlwriter
	Zend OPcache
	zip
	zlib

	[Zend Modules]
	Zend OPcache
	
	[PECL]
	APCu
	SSH2

## Installing Extensions

Please note that you need to restart `php7-fpm` to activate the extension.

### Install the Memcached Extension

	cd php-7-debian/extensions
	./memcached-build.sh
	./memcached-install.sh

### Install the Imagick Extension

	cd php-7-debian/extensions
	./imagick-build.sh
	./imagick-install.sh

### After installation

	cd ..
	sudo ./update.sh

## Credits

- Created by [Kaspars Dambis](http://kaspars.net)
- Contributors: [Piotr Plenik](https://github.com/jupeter)
- Based on [`php7.sh`](https://gist.github.com/tvlooy/953a7c0658e70b573ab4) by [Tom Van Looy](http://www.intracto.com/nl/blog/running-symfony2-on-php7)
