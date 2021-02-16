FROM php:7.2-cli
RUN docker-php-ext-enable exif
CMD [ "php", "$SCRIPT" ]
