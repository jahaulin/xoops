FROM php:5-apache

WORKDIR /var/www/html
RUN apt-get update \
    && apt-get install unzip \
    && wget http://campus-xoops.tn.edu.tw/modules/tad_uploader/index.php?op=dlfile&cfsn=112&cat_sn=11&name=install_1.2_20160603.zip \
    && unzip install_1.2_20160603.zip \
    && mv htdocs/* . \
    && rm -rf htdocs \
    && chown -R www-data:www-data . \
    && apt-get clean all

EXPOSE 80 443
CMD ["apache2-foreground"]
