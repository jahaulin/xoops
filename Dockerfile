FROM php:5-apache

WORKDIR /var/www/html
RUN apt-get update \
    && apt-get install unzip \
    && wget http://campus-xoops.tn.edu.tw/modules/tad_modules/xoops.php?op=tufdl&files_sn=1396#XoopsCore25-2.5.8_tw_20160616.zip \
    && unzip XoopsCore25-2.5.8_tw_20160616.zip \
    && mv htdocs/* . \
    && rm -rf htdocs \
    && chown -R www-data:www-data .

EXPOSE 80 443
CMD ["apache2-foreground"]
