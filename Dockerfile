FROM php:7.2-cli
RUN apt-get update
RUN apt-get install -y \
    libbz2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxpm-dev \
    libvpx-dev \
    libmcrypt-dev \
    libmemcached-dev \
    libicu-dev \
    libc-client-dev \
    libkrb5-dev

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure exif \
            --enable-exif
            
RUN docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-xpm-dir=/usr/include/

RUN docker-php-ext-configure imap \
		--with-kerberos \
		--with-imap-ssl
    
RUN docker-php-ext-install \
    bz2 \
    exif \
    fileinfo \
    ftp \
    gd \
    gettext \
    gmp \
    imap \
    interbase \
    intl \
    ldap \
    mbstring \
    mysqli \
    oci8 \
    odbc \
    opcache \
    pdo_firebird \
    pdo_mysql \
    pdo_oci \
    pdo_odbc \
    pdo_pgsql \
    pdo_sqlite \
    pgsql \
    shmop \
    snmp \
    soap \
    sockets \
    sysvshm \
    tidy \
    xmlrpc \
    xsl  

    
COPY start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
ENTRYPOINT ["/bin/start.sh"]
