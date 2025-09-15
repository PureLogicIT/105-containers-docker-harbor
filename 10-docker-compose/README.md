# 07 Docker Compose

Among many other things, docker compose allows you to bundle container configurations and instructions for easier management and startup of your environment. It also allows you to launch applications that require more than one container such as a webserver and a database.

Docker compose is written as a configuration file using yaml. It uses many of the same flags that docker uses and allows for many additional items such as shared variables, volumes, networks and other multi-container interactions.

```
#website.yml

version: '3.9'
services:
  apache:
    image: httpd:latest
    container_name: my-apache-app
    ports:
    - '8080:80'
    volumes:
    - ./website:/usr/local/apache2/htdocs
```

Here is another example where a compose file is using multiple containers

```
version: '3.9'
services:
  db:
    image: mariadb:10.6.4-focal
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=somewordpress
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - MYSQL_PASSWORD=wordpress
    expose:
      - 3306

  wordpress:
    image: wordpress:latest
    volumes:
      - wp_data:/var/www/html
    ports:
      - 80:80
    depends_on: db
    restart: always
    environment:
      - WORDPRESS_DB_HOST=db
      - WORDPRESS_DB_USER=wordpress
      - WORDPRESS_DB_PASSWORD=wordpress
      - WORDPRESS_DB_NAME=wordpress

volumes:
  db_data:
  wp_data:
```

### Save to git
Let save this compose file for later 
```bash
git add .
git commit -m "Adding compose file"
git push

```
