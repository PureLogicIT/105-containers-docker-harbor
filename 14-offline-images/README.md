# 13 Offline images

In some cases, you need an image on a machine that can't access a docker web api to download an image from the internet. For those, you'll want to save an image as a tar ball and move it to that machine.

On the online machine
```
docker save nginx -o nginx.tar
```

On the air gapped machine
```
docker load nginx -i nginx.tar
```
