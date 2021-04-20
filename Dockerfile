FROM ubuntu/apache2

RUN a2enmod rewrite
RUN a2enmod fcgid

COPY apache2.conf /etc/apache2/apache2.conf
COPY index.html /srv/www/index.html
