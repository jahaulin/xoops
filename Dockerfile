FROM php:5-apache

WORKDIR /var/www/html
RUN apt-get update \
    && apt-get install -y wget \
    && wget 'http://ftp.tw.debian.org/debian/pool/main/u/unzip/unzip_6.0-16+deb8u3_amd64.deb' \
    && dpkg -i unzip_6.0-16+deb8u3_amd64.deb \
    && wget 'http://campus-xoops.tn.edu.tw/modules/tad_uploader/index.php?op=dlfile&cfsn=121&cat_sn=16&name=xoopscore25-2.5.8_tw_20160616.zip' -O xoops.zip \
    && unzip xoops.zip \
    && mv XoopsCore25-2.5.8/htdocs/* . \
    && rm -rf XoopsCore25-2.5.8 \
    && chown -R www-data:www-data . \
EXPOSE 80 443
CMD ["apache2-foreground"]
