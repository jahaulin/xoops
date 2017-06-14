FROM php:5-apache

WORKDIR /var/www/html
RUN apt-get update \
    && apt-get install -y wget unzip \
    && wget 'http://campus-xoops.tn.edu.tw/modules/tad_uploader/index.php?op=dlfile&cfsn=121&cat_sn=16&name=xoopscore25-2.5.8_tw_20160616.zip' -O xoops.zip \
    && unzip xoops.zip \
    && mv XoopsCore25-2.5.8/htdocs/* . \
    && rm -rf XoopsCore25-2.5.8 \
    && chown -R www-data:www-data . \
    && apt-get clean all \
    && chmod -R 777 /var/www/html/uploads \
    && chmod -R 777 /var/www/html/xoops_lib/modules/protector/configs/ \
    && chmod -R 777 /var/www/html/include/license.php \
    && mv /var/www/html/xoops_lib /var/www/ \
    && mv /var/www/html/xoops_data /var/www/ \
    && chmod -R 777 /var/www/xoops_data/caches \
    && chmod -R 777 /var/www/xoops_data/caches/xoops_cache \
    && chmod -R 777 /var/www/xoops_data/caches/smarty_cache \
    && chmod -R 777 /var/www/xoops_data/caches/smarty_compile \
    && chmod -R 777 /var/www/xoops_data/configs \
    && chmod -R 777 /var/www/xoops_data/data

EXPOSE 80 443
CMD ["apache2-foreground"]
