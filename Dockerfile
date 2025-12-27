FROM dunglas/frankenphp

RUN apt-get update && \
	apt-get install -y git zip unzip mariadb-client

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 
# # add additional extensions here:
RUN install-php-extensions \
	mysqli

# gd \
# intl \
# zip \
