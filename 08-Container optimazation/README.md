# Dockerfile Optimization

In this excersise, we will be learning how we can reduce the amount of Layers and size of our docker images when creating an image for an app that is in development.

### create the scribble image
---
First, open up the scribble folder and build the dockerfile. Then run a docker container with the image.

```
docker build -t scribble:unoptimized .
docker run --name scribble1 -p 8080:8080 scribble:unoptimized
```
Open up a browser to and try reaching.

Once you confirm everything is working, let's examine the image and docker file.

### Examination
---
Once we have all of the images pulled we can inspect them and gain more detail as well as size and layers. 

```
docker image inspect {image-path}
```

You will noticed that this images is 1.17 GB in size and contain 12 layers. Now lets open up the Docker file.

First thing is it's using the golang image, which is used to build any golang apps. Once it's built, we don't need any of the tools that golang comes with it.

The second thing is download the source code into the image. Once again, we require this for building it, but once it's done creating the scribble script. Also, if we push the image to a public registry for all to use, the source code will be available to everyone. So we will need to remove that.

### Creating a second stage

Lets edit the docker file and add a name to the first stage called build:

```
FROM docker.io/golang:1.23.3 AS builder
```

Lets create the second stage at the bottom of the docker file and we will use the base image of alpine.

```
FROM alpine
```

Lets copy the needed scribble script from the builder stage.

```
FROM alpine
COPY --from=builder /app/scribblers /scribblers

ENTRYPOINT ["/scribblers"]
```

Now build and run a new docker container

```
docker build -t scribble:optimized .
docker run --name scribble2 -p 80:8080 scribble:optimized
```

### Examin the new image

```
docker image inspect {image-path}
```

You should now notice a major in size now. The new image is only 23.1 MB and contain  only 3 layers. This is a greater improvement from the original.

### Save to git
Let save our updated docker file to git for possible editing later !
```bash
git add .
git commit -m "Adding optomize docker file"
git push

```