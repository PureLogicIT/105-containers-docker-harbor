# Container Image size and layers

This section will explain how to examin image size and layers. In this execise we will look download 3 base images that most container images are inherited from. It's important to know this because there is a limit on the amount of layers and if you are inheriting an image that already contains many layers, you will not be able to expand or add more to your local image.

| Image | Path |
|-------|------|
| Ubuntu | ubuntu:latest |
| RedHat UBI | redhat/ubi10:latest |
| Alpine| alpine:latest |

```
docker image pull {image-path}
```

Once we have all of the images pulled we can inspect them and gain more detail as well as size and layes. 

```
docker image inspect {image-path}
```

If we want more detail for each layer we can also look at it's history.

```
docker image history {image-path}
```