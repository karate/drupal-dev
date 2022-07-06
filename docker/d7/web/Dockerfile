FROM php:7.3-apache-buster

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

# Create user with the same uid and gid as host
ARG UID
ARG GID
RUN useradd -c 'container user' -u ${UID} -g ${GID} dev
