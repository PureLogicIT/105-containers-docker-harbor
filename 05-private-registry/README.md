# 12 Private Registries

There are many reasons to use a private registry. If you're in an air gapped environment it can offer a local mirror for public containers. In an online but more security conscious environment it can be a smaller currated list of approved apps. In a development workshop it can be a place to store your custom applications.

For this workshop we'll be using the CNCF graduate project Harbor. But many private registries exist, common alternatives could by RedHat's Quay, JFrog Artifactory, Kraken or online registries like Docker Hub, Amazon Elasitic Container Registry, Google Container Registry, Github Container Registry and more.

|        |                         |
|--------|-------------------------|
|URL     |harbor.dev.purelogicit.ca|
|Username|admin                    |
|Password|Harbor12345              |

## Uploading an image

Let’s say you have an image like `nginx` on your workstation you want to upload to your private registry

First tag the image adding your registry's fqdn and project in front of the name. It's also good practice to use the proper tags at this stage

```
docker tag nginx harbor.dev.purelogicit.ca/plworkshop/nginx:1.23.1
```

Then run the `push` command against the new tag of the image

```
docker push harbor.dev.purelogicit.ca/plworkshop/nginx:1.23.1
```

To set the default `latest` tag, you will need to run the `tag` and `push` commands again
```
docker tag harbor.dev.purelogicit.ca/plworkshop/nginx:1.23.1  harbor.dev.purelogicit.ca/plworkshop/nginx:latest
docker push harbor.dev.purelogicit.ca/plworkshop/nginx:latest
```

## Downloading an image

Docker automatically pull images from its default registry (hub.docker.com for docker, registry.access.redhat.com and quay.io for podman). To use a different registry, provide the fqdn

```
docker pull harbor.dev.purelogicit.ca/plworkshop/nginx
```

Just like the default registry it will look for the image that has the `latest` tag unless you specify a different one
