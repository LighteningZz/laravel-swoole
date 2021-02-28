# Package.Name=laravel-swoole
FROM phpswoole/swoole:php7.4 
# Set working directory
WORKDIR /var/www/

RUN \
    apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    libpng-dev \
    libssl-dev \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath gd sockets opcache \
    && pecl update-channels pecl.php.net \
    && pecl install -o -f redis   \
    && docker-php-ext-enable redis \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/* 