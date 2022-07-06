FROM php:7.4-apache-buster

RUN apt-get update -y && \
apt install -y libpng-dev default-mysql-client default-mysql-client libzip-dev git libgmp-dev

# php modules
RUN docker-php-ext-install mysqli pdo pdo_mysql gd zip gmp

# Install drush
RUN curl -L https://github.com/drush-ops/drush/releases/download/8.4.8/drush.phar --output /usr/local/bin/drush
RUN chmod +x /usr/local/bin/drush

# Install composer
RUN curl -L https://getcomposer.org/download/latest-1.x/composer.phar --output /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

RUN a2enmod rewrite

# php memory limit
RUN echo 'memory_limit = 4G' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

# Create user with the same uid and gid as host
ARG UID
ARG GID
RUN useradd -c 'container user' -u ${UID} -g ${GID} dev

# Set timezone
RUN ln -snf /usr/share/zoneinfo/Europe/Athens /etc/localtime
RUN sed -i 's/;date.timezone =/date.timezone = "Europe\/Athens"/' /usr/local/etc/php/php.ini-development
RUN sed -i 's/;date.timezone =/date.timezone = "Europe\/Athens"/' /usr/local/etc/php/php.ini-production
