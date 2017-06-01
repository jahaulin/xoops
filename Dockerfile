FROM php:5-apache

WORKDIR /var/www/html
RUN apt-get update \
    && apt-get install -y wget unzip \
    && wget 'http://campus-xoops.tn.edu.tw/modules/tad_uploader/index.php?op=dlfile&cfsn=121&cat_sn=16&name=xoopscore25-2.5.8_tw_20160616.zip' -O xoops.zip \
    && unzip xoops.zip \
    && mv XoopsCore25-2.5.8/htdocs/* . \
    && rm -rf XoopsCore25-2.5.8 \
    && chown -R www-data:www-data . \
    && apt-get clean all
EXPOSE 80 443
CMD ["apache2-foreground"]
