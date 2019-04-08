# xoops2.5
This packages default uploadsize is 100MB
這包預設跑起來可以上傳的大小是100MB
```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=yourpassword -p 3306:3306 -d mysql

docker run --name phpmyadmin --link mysql:db -p 8088:80 -d phpmyadmin/phpmyadmin

docker run --name xoops --link mysql:db -p 80:80 -d jahaulin/xoops
```
