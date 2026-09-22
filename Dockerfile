FROM php:8.2-apache

# Zaroori extensions install karo (Laravel ke liye)
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install pdo_mysql zip \
    && rm -rf /var/lib/apt/lists/*

# Composer ko globally install karo
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Apache ko batayen ke Laravel ka 'public' folder hi main folder hai
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# Working directory set karo
WORKDIR /var/www/html