FROM php:7.3-apache

LABEL "maintainer"="Steve Blamey <sblamey@uzerp.com>" 

ADD 'https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions' '/usr/local/bin/'
RUN chmod a+x /usr/local/bin/install-php-extensions
RUN sync
RUN /usr/local/bin/install-php-extensions pdo_pgsql pgsql memcached bcmath gettext gd xdebug

RUN bash -c 'echo "xdebug.default_enable = off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'
RUN bash -c 'echo "xdebug.remote_enable = on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'
RUN bash -c 'echo "xdebug.remote_autostart = off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'
RUN bash -c 'echo "xdebug.remote_connect_back = off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'

RUN bash -c 'curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer'
# (debian) OpenJRE installation will fail if this directory
# is not present.
RUN mkdir -p /usr/share/man/man1


RUN apt-get update
RUN apt-get -y install fop qpdf iproute2

# Copy in Barcode4J and custom apache fop script
COPY files/barcode4j-2.1.0/ /usr/share/barcode4j-2.1.0/
COPY files/fop /usr/bin/fop

