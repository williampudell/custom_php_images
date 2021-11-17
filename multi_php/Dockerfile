FROM ubuntu:focal

WORKDIR /var/www/html

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y iputils-ping redis-tools curl gnupg2 ca-certificates lsb-release apt-transport-https
RUN apt-get install -y cron zip unzip git net-tools
RUN add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y apache2 libapache2-mod-php7.2 php7.2-fpm php7.2 \
    php7.2-bcmath php7.2-cli php7.2-curl php7.2-dev php7.2-gd \
    php7.2-imap php7.2-intl php7.2-mbstring php7.2-mysql \
    php7.2-pgsql php7.2-pspell php7.2-xml php7.2-xmlrpc \
    php7.2-zip hp7.2-mbstring php7.2-soap php7.2-xml php7.2-http \
    php7.2-curl php7.2-zip php7.2-json php7.2-bz2 php7.2-xsl \
    php7.2-bcmath php7.2-raphf php7.2-propro php7.2-gd php7.2-mysql php7.2-opcache
RUN apt-get install -y libapache2-mod-php7.3 php7.3-fpm php7.3 \
    php7.3-bcmath php7.3-cli php7.3-curl php7.3-dev php7.3-gd \
    php7.3-imap php7.3-intl php7.3-mbstring php7.3-mysql \
    php7.3-pgsql php7.3-pspell php7.3-xml php7.3-xmlrpc \
    php7.3-zip php7.3-opcache
RUN apt-get install -y libapache2-mod-php7.4 php7.4-fpm php7.4 \
    php7.4-bcmath php7.4-cli php7.4-curl php7.4-dev php7.4-gd \
    php7.4-imap php7.4-intl php7.4-mbstring php7.4-mysql \
    php7.4-pgsql php7.4-pspell php7.4-xml php7.4-xmlrpc \
    php7.4-zip php7.4-opcache
RUN apt-get install -y libapache2-mod-php8.0 php8.0-fpm php8.0 \
    php8.0-bcmath php8.0-cli php8.0-curl php8.0-dev php8.0-gd \
    php8.0-imap php8.0-intl php8.0-mbstring php8.0-mysql \
    php8.0-pgsql php8.0-pspell php8.0-xml php8.0-xmlrpc \
    php8.0-zip php8.0-opcache
RUN apt-get install -y libapache2-mod-php7.1 php7.1-fpm php7.1 \
    php7.1-bcmath php7.1-cli php7.1-curl php7.1-dev php7.1-gd \
    php7.1-imap php7.1-intl php7.1-mbstring php7.1-mysql \
    php7.1-pgsql php7.1-pspell php7.1-xml php7.1-xmlrpc \
    php7.1-zip hp7.1-mbstring php7.1-soap php7.1-xml php7.1-http \
    php7.1-curl php7.1-zip php7.1-json php7.1-bz2 php7.1-xsl \
    php7.1-bcmath php7.1-raphf php7.1-propro php7.1-gd php7.1-mysql php7.1-opcache
RUN apt-get install -y libapache2-mod-php8.1 php8.1-fpm php8.1 \
    php8.1-bcmath php8.1-cli php8.1-curl php8.1-dev php8.1-gd \
    php8.1-imap php8.1-intl php8.1-mbstring php8.1-mysql \
    php8.1-pgsql php8.1-pspell php8.1-xml php8.1-xmlrpc \
    php8.1-zip php8.1-opcache

RUN apt-get install -y apt-utils

RUN apt-get install -y supervisor

RUN a2enmod rewrite actions alias proxy_fcgi setenvif

RUN a2dissite 000-default

RUN a2enconf php7.1-fpm php7.2-fpm php7.3-fpm php7.4-fpm php8.0-fpm

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

RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.1/apache2/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.1/fpm/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.1/cli/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.1/apache2/php.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.1/fpm/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.1/cli/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.1/apache2/conf.d/10-opcache.ini \
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.2/apache2/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.2/fpm/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.2/cli/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.2/apache2/php.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.2/fpm/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.2/cli/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.2/apache2/conf.d/10-opcache.ini \
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.3/fpm/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.3/cli/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/7.3/apache2/php.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.3/fpm/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.3/cli/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.3/apache2/conf.d/10-opcache.ini \
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/7.4/apache2/php.ini \
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
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/7.4/apache2/conf.d/10-opcache.ini \
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/8.0/apache2/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/8.0/fpm/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/8.0/cli/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/8.0/apache2/php.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/8.0/fpm/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/8.0/cli/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/8.0/apache2/conf.d/10-opcache.ini \
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 700M/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 700M/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/max_execution_time = 30/max_execution_time = 90/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/; max_input_vars = 1000/max_input_vars = 2000/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=32531/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/;opcache.dups_fix=0/opcache.dups_fix=1/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=60/g' /etc/php/8.1/apache2/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/8.1/fpm/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/8.1/cli/php.ini \
&& sed -i 's/;opcache.error_log=/opcache.error_log=\/var\/log\/php-opcache-error.log/g' /etc/php/8.1/apache2/php.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/8.1/fpm/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/8.1/cli/conf.d/10-opcache.ini \
&& echo 'opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=64\n\
opcache.max_accelerated_files=32531\n\
opcache.validate_timestamps=0\n\
opcache.enable_cli=1\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_file_override=1\n\
opcache.error_log=/var/log/php-opcache-error.log' | tee /etc/php/8.1/apache2/conf.d/10-opcache.ini

RUN php-fpm7.1 -t \ 
&& php-fpm7.2 -t \
&& php-fpm7.3 -t \
&& php-fpm7.4 -t \
&& php-fpm8.0 -t \
&& php-fpm8.1 -t

RUN /etc/init.d/php7.1-fpm start \
&& /etc/init.d/php7.2-fpm start \
&& /etc/init.d/php7.3-fpm start \
&& /etc/init.d/php7.4-fpm start \
&& /etc/init.d/php8.0-fpm start \
&& /etc/init.d/php8.1-fpm start

RUN update-alternatives --set php /usr/bin/php8.1 \
&& update-alternatives --set phar /usr/bin/phar8.1 \
&& update-alternatives --set phar.phar /usr/bin/phar.phar8.1 \
&& update-alternatives --set phpize /usr/bin/phpize8.1 \
&& update-alternatives --set php-config /usr/bin/php-config8.1

RUN /etc/init.d/cron start

RUN /usr/sbin/apache2ctl restart