#!/bin/bash

TAG_DATE=$(date +%Y%m%d)

docker build ./php7.1/ -t williampudell-php7.1:$TAG_DATE -t williampudell-php7.1:latest

docker build ./php7.2/ -t williampudell-php7.2:$TAG_DATE -t williampudell-php7.2:latest

docker build ./php7.3/ -t williampudell-php7.3:$TAG_DATE -t williampudell-php7.3:latest

docker build ./php7.4/ -t williampudell-php7.4:$TAG_DATE -t williampudell-php7.4:latest

docker build ./php8.0/ -t williampudell-php8.0:$TAG_DATE -t williampudell-php8.0:latest

docker build ./php8.1/ -t williampudell-php8.1:$TAG_DATE -t williampudell-php8.1:latest

docker build ./multi-php/ -t williampudell-multi-php:$TAG_DATE -t williampudell-multi-php:latest