FROM ubuntu:bionic

### update
RUN apt-get -q update
RUN apt-get -q -y upgrade
RUN apt-get -q -y dist-upgrade
RUN apt-get clean
RUN apt-get -q update

RUN apt-get -q -y install  openssh-server git autoconf automake make libtool pkg-config cmake \
    apache2 libapache2-mod-fcgid libfcgi0ldbl zlib1g-dev libpng-dev libjpeg-dev libtiff5-dev \
    libgdk-pixbuf2.0-dev libxml2-dev libsqlite3-dev libcairo2-dev libglib2.0-dev g++ libmemcached-dev \
    libjpeg-turbo8-dev htop

RUN a2enmod rewrite
RUN a2enmod fcgid

COPY apache2.conf /etc/apache2/apache2.conf
COPY index.html /srv/www/index.html
COPY ports.conf /etc/apache2/ports.conf
COPY fcgid.conf /etc/apache2/mods-enabled/fcgid.conf

ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_PID_FILE=/apache/apache2.pid
ENV APACHE_RUN_DIR=/apache
ENV APACHE_LOCK_DIR=/apache
ENV APACHE_LOG_DIR=/apache

#RUN /bin/bash -c "source /etc/apache2/envvars"

CMD ["apachectl", "-D FOREGROUND"]
