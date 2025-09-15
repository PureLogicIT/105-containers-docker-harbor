#!/bin/bash
docker volume create wordpress
docker network create my_net
docker run -d --name mysql --network my_net -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wp_user -e MYSQL_PASSWORD=password1 -e  MYSQL_ROOT_PASSWORD=password mysql
docker run -d --name wordpress --network my_net -v wordpress:/var/www/html -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=wp_user -e WORDPRESS_DB_PASSWORD=password1 -e WORDPRESS_DB_NAME=wordpress wordpress:6.1-fpm
docker run -d --name nginx --network my_net -v wordpress:/var/www/html -v $PWD/default.conf:/etc/nginx/conf.d/default.conf -p 8180:80 nginx
