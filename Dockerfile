FROM php:7.2-cli
RUN apt-get install -y \
    libbz2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libxpm-dev \
    libvpx-dev \
    libmcrypt-dev \
    libmemcached-dev \
    && \
apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    
docker-php-ext-configure exif \
            --enable-exif
            
docker-php-ext-configure gd \
        --with-freetype-dir=/usr/lib/x86_64-linux-gnu/ \
        --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
        --with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
        --with-vpx-dir=/usr/lib/x86_64-linux-gnu/ \
    && \
    
docker-php-ext-install \
    exif \
    gd \
    && \   
    
COPY start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
ENTRYPOINT ["/bin/start.sh"]
