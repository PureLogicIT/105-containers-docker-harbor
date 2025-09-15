# 04 Persistent Storage

There are two popular ways to create persistent volumes. The easiest is to use a volume object, created using a simple command:

```
docker volume create web_files_volume
```

To view any existing volumes, use the docker command below:

```
docker volume ls
```

This volume can be attached to a container to add persistent storage that can be shared or moved

```
docker run -d -v web_files_volume:/usr/share/nginx/html nginx
```

The other type of volume that can be attached is a local folder. This allows you to manage the content locally, perhaps using code revision or a repository

```
docker run -d -v $PWD/web_files_volume:/usr/share/nginx/html nginx
```

Depending on the environment, both storage types offer benefits and drawbacks

