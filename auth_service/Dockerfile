FROM php:8-fpm

USER root

RUN apt-get update \
  && apt-get install -y \
             apt-utils \
             man \
             curl \
             wget \
             git \
             bash \
             vim \
             zip unzip \
             acl \
             iproute2 \
             dnsutils \
             fonts-freefont-ttf \
             fontconfig \
             dbus \
             openssh-client \
             sendmail \
             libfreetype6-dev \
             libjpeg62-turbo-dev \
             icu-devtools \
             libicu-dev \
             libmcrypt4 \
             libmcrypt-dev \
             libpng-dev \
             zlib1g-dev \
             libxml2-dev \
             libzip-dev \
             libonig-dev \
             graphviz \
             libcurl4-openssl-dev \
             pkg-config \
             libldap2-dev \
             libpq-dev \
             supervisor


RUN docker-php-ext-configure intl --enable-intl && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install pdo \
        pgsql pdo_pgsql \
        mysqli pdo_mysql \
        intl iconv mbstring \
        zip pcntl \
        exif opcache \
        soap   \
        sockets \
    && docker-php-source delete

# Clear cache
RUN apt clean && rm -rf /var/lib/apt/lists/*

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

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

RUN wget https://get.symfony.com/cli/installer -O - | bash

WORKDIR /var/www/html

# Export composer vendor path
RUN echo "" >> ~/.bashrc && \
    echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc

   
USER $user

# Copy existing application directory contents
COPY ./ /var/www/html/


EXPOSE 9001

CMD ["php-fpm"]
