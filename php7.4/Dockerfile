FROM ubuntu:focal

WORKDIR /var/www/html

RUN apt-get update
RUN apt-get install -y software-properties-common apt-utils
RUN apt-get install -y iputils-ping redis-tools curl gnupg2 ca-certificates lsb-release apt-transport-https
RUN apt-get install -y cron zip unzip
RUN apt-get install -y supervisor
RUN add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y apache2 libapache2-mod-php7.4 php7.4-fpm php7.4 \
    php7.4-bcmath php7.4-cli php7.4-curl php7.4-dev php7.4-gd \
    php7.4-imap php7.4-intl php7.4-mbstring php7.4-mysql \
    php7.4-pgsql php7.4-pspell php7.4-xml php7.4-xmlrpc \
    php7.4-zip php7.4-apcu php7.4-apcu-bc php7.4-common php7.4-apcu \
    php7.4-common php7.4-igbinary php7.4-memcached php7.4-msgpack php7.4-redis

RUN a2enmod rewrite actions alias proxy_fcgi setenvif

RUN a2dissite 000-default

RUN a2enconf php7.4-fpm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install nodejs -y

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

RUN apt-get update && apt-get install -y vim nano gpg-agent \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.4/apache2/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.4/fpm/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.4/cli/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.4/apache2/php.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.4/fpm/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.4/cli/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.4/apache2/conf.d/10-opcache.ini

RUN php-fpm7.4 -t

RUN /etc/init.d/php7.4-fpm start

RUN update-alternatives --set php /usr/bin/php7.4 \
&& update-alternatives --set phar /usr/bin/phar7.4 \
&& update-alternatives --set phar.phar /usr/bin/phar.phar7.4 \
&& update-alternatives --set phpize /usr/bin/phpize7.4 \
&& update-alternatives --set php-config /usr/bin/php-config7.4

RUN /etc/init.d/cron start

RUN /usr/sbin/apache2ctl restart