# 06 Multi-Container Apps

Unlike with traditional deployments that run everything on one server. With contains your going to want to run each of your services in their own separate optimized containers. For this example, we'll use a 3 tier app with a Web server, the application and a database. We'll use WordPress for this.

Create a new isolated network for our containers to use. The default bridge network doesn't allow containers to talk to each other
```
docker network create my_net
```

We'll create a dedicated volume for the wordpress website content. This will be used to share the site with the nginx web server
```
docker volume create wordpress
```

Create a local file that will define the NGINX configurations

*default.conf*
```
server {
        listen 80;
        listen [::]:80;

        server_name localhost;

        index index.php index.html index.htm;

        root /var/www/html;

        location / {
                try_files $uri $uri/ /index.php$is_args$args;
        }

        location ~ \.php$ {
                try_files $uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass wordpress:9000;
                fastcgi_index index.php;
                include fastcgi_params;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                fastcgi_param PATH_INFO $fastcgi_path_info;
        }

        }
}

```

Create a MySQL database
```
docker run -d --name mysql --network my_net -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wp_user -e MYSQL_PASSWORD=password1 -e MYSQL_ROOT_PASSWORD=password1 mysql
```

Next, we start the actual wordpress container. It will communicate with the MySQL database through the internal network using environment variables to define the configurations
```
docker run -d --name wordpress --network my_net -v wordpress:/var/www/html -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=wp_user -e WORDPRESS_DB_PASSWORD=password1 -e WORDPRESS_DB_NAME=wordpress wordpress:6.1-fpm
```

Now to expose our app, we'll use NGINX and attaching it to the same volume used by wordpress to expose the site content.
```
docker run -d --name nginx --network my_net -v wordpress:/var/www/html -v $PWD/default.conf:/etc/nginx/conf.d/default.conf -p 8180:80 nginx
```
