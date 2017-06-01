FROM php:5-apache

WORKDIR /var/www/html
RUN apt-get install -y unzip wget \
    && wget 'http://campus-xoops.tn.edu.tw/modules/tad_uploader/index.php?op=dlfile&cfsn=121&cat_sn=16&name=xoopscore25-2.5.8_tw_20160616.zip' -O xoops.zip \
    && unzip xoops.zip \
    && mv htdocs/* . \
    && rm -rf htdocs \
    && chown -R www-data:www-data . \
EXPOSE 80 443
CMD ["apache2-foreground"]
