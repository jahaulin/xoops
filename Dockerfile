FROM php:5-apache

WORKDIR /var/www/html
RUN apt-get update \
    && apt-get install wget \
    && wget http://ftp.tw.debian.org/debian/pool/main/u/unzip/unzip_6.0-16+deb8u3_amd64.deb \
    && dpkg -i unzip_6.0-16+deb8u3_amd64.deb \
    && wget https://drive.google.com/file/d/0B10sd4GxPzH5ZE9BVFp6X1VsRE0/view?usp=sharing \
    && unzip XoopsCore25-2.5.8.zip \
    && mv htdocs/* . \
    && rm -rf htdocs \
    && chown -R www-data:www-data . \
    && apt-get clean all 
EXPOSE 80 443
CMD ["apache2-foreground"]
