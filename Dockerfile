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

# 👇 YEH 3 LINES APACHE KO THEEK KARENGI 👇
# 1. mod_rewrite enable karo
# 2. DocumentRoot ko 'public' folder par set karo
# 3. .htaccess file ko parhne ki ijazat do (AllowOverride All)
RUN a2enmod rewrite \
    && sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Working directory set karo
WORKDIR /var/www/html