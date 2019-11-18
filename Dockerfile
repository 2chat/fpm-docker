FROM php:5.6-fpm

RUN apt-get update
RUN apt-get install -y unzip
RUN    apt-get install -y libfreetype6-dev \
    && apt-get install -y libjpeg62-turbo-dev \
    && apt-get install -y libpq-dev \
    && apt-get install -y libmagickwand-dev \
    && apt-get install -y libmcrypt-dev \
    && apt-get install -y libpng-dev \
    && apt-get install -y libmemcached-dev \
    && apt-get install -y libssl-dev \
    && apt-get install -y libssl-doc \
    && apt-get install -y libicu-dev \
    && apt-get install -y libaio-dev \
    && apt-get install -y g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install \
        mbstring \
        mcrypt \
        exif \
        opcache \
        pgsql \
        pdo_pgsql \
        gd \
    && pecl channel-update pecl.php.net \
    && pecl install xdebug-2.5.1 && docker-php-ext-enable xdebug \
    && yes '' | pecl install imagick && docker-php-ext-enable imagick