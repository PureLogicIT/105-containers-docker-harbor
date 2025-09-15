# Environment Variables

To learn about environment variables, we'll use this custom docker image that we created that uses a environment variable. The text in the `MESSAGE` environment variable will be displayed on the page.

To set the value of the environment variable we use the `-e` or `--env` flag.

```
docker run -e MESSAGE=example -p 8080:80 pljlevac/docker-example
```

```
curl localhost:8080
  example
```

If you need to pass multiple environment variables, you simply repeat the `-e` flag.

```
docker run -e MARIADB_USER=user -e MARIADB_PASSWORD=password  mariadb
```

You can also use an environment file

.env
```
MESSAGE=file example
```

```
docker run -p 8080:80 --env-file .env pljlevac/docker-example
```
