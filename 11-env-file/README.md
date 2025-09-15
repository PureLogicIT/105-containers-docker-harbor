# 08 Docker Compose with Env file

Last time we set all the variables directly into the `docker-compose.yml` including the password. In a latter step, we'll be going to commit our code with git and we don't want the password to go along with it.

Docker Compose will automatically load variable from a `.env` file in the same folder as the `docker-compose.yml`

Update the `docker-compose.yml` from last time changing the actual password to `${DB_PASSWORD}` and add the below `.env` file beside it

*docker-compose.yml*
```
version: '3.9'
services:
  db:
    image: mariadb:10.6.4-focal
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD}
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - MYSQL_PASSWORD=${MYSQL_PW}
    expose:
      - 3306

  wordpress:
    image: wordpress:latest
    volumes:
      - wp_data:/var/www/html
    ports:
      - 80:80
    depends_on: 
      - db
    restart: always
    environment:
      - WORDPRESS_DB_HOST=db
      - WORDPRESS_DB_USER=wordpress
      - WORDPRESS_DB_PASSWORD=${MYSQL_PW}
      - WORDPRESS_DB_NAME=wordpress

volumes:
  db_data:
  wp_data:
```

*.env*
```
MYSQL_PW=WpPassword1
MYSQL_ROOT_PASSWORD=RootPassword1
```
### Save to git
Time to save our progress!
```bash
git add .
git commit -m "editing custom docker file"
git push

```