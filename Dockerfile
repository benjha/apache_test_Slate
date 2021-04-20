FROM ubuntu/apache2

### update
RUN apt-get -q update
RUN apt-get -q -y upgrade
RUN apt-get -q -y dist-upgrade
RUN apt-get clean
RUN apt-get -q update

RUN apt-get -q -y install  openssh-server git autoconf automake make libtool pkg-config cmake apache2 libapache2-mod-fcgid libfcgi0ldbl zlib1g-dev libpng-dev libjpeg-dev libtiff5-dev libgdk-pixbuf2.0-dev libxml2-dev libsqlite3-dev libcairo2-dev libglib2.0-dev g++ libmemcached-dev libjpeg-turbo8-dev

RUN a2enmod rewrite
RUN service apache2 restart

RUN a2enmod fcgid

COPY apache2.conf /etc/apache2/apache2.conf
COPY index.html /srv/www/index.html

