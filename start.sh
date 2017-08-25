#!/bin/sh

if [ ! -d /var/www/html/uploads ]; then 
  mkdir -p /var/www/html/uploads/avatars/
  mkdir    /var/www/html/uploads/images/
  mkdir    /var/www/html/uploads/ranks/
  mkdir    /var/www/html/uploads/smilies/
  chmod -R 777 /var/www/html/uploads
fi
if [  -d /var/www/html/xoops_lib/modules/protector/configs]; then
  chmod -R 777 /var/www/html/xoops_lib/modules/protector/configs/
fi
if [ -f /var/www/html/include/license.php ]; then
   chmod -R 777 /var/www/html/include/license.php
fi
if [ ! -d /var/www/xoops_lib/modules ]; then
   mv /var/www/html/xoops_lib /var/www/
fi
if [ ! -d /var/www/xoops_data ]; then
   mv /var/www/html/xoops_data /var/www/
   chmod -R 777 /var/www/xoops_data/caches
   chmod -R 777 /var/www/xoops_data/caches/xoops_cache
   chmod -R 777 /var/www/xoops_data/caches/smarty_cache
   chmod -R 777 /var/www/xoops_data/caches/smarty_compile
   chmod -R 777 /var/www/xoops_data/configs
   chmod -R 777 /var/www/xoops_data/data
fi
apache2-foreground
