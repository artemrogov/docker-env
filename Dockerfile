FROM php:7.4-fpm
#FROM php:8.0.5-fpm-alpine

#FROM php:8.0.5-fpm

USER root

RUN apt-get update && apt-get install -y nano \
    git \
    curl \
    libpq-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
          pdo \
          exif \
          pcntl \
          bcmath \
          gd \
          calendar \
          tokenizer \
          json \
          soap \
          iconv \
          fileinfo \
          xml    

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql
            
# Create system user to run Composer and Artisan Commands
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
        
ARG user
ARG uid

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid $user

RUN usermod -a -G sudo $user

RUN usermod -a -G www-data $user

RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Export composer vendor path
RUN echo "" >> ~/.bashrc && \
    echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc
   
USER $user

WORKDIR /var/www/html

# Copy existing application directory contents
COPY ./ /var/www/html

# Expose port 9000 and start php-fpm server
EXPOSE 9000

CMD ["php-fpm"]
