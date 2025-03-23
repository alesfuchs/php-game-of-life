FROM php:8.2-cli

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    curl \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-install simplexml dom \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Get Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Setup user and permissions
RUN addgroup --system --gid 1000 appgroup \
    && adduser --system --uid 1000 --ingroup appgroup appuser \
    && mkdir -p /home/appuser/.composer /var/www \
    && chown -R appuser:appgroup /home/appuser /var/www

WORKDIR /var/www
USER appuser 