FROM php:7.2-cli
RUN docker-php-ext-install exif
RUN docker-php-ext-configure exif \
            --enable-exif
COPY start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
ENTRYPOINT ["/bin/start.sh"]
