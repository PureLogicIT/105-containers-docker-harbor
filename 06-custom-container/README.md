# Creating a Custom Container

So far we've used a default nginx container. You will probably need to run a custom container at some point. In this example we'll create our own nginx container from scratch

Containers are defined using a file named `Dockerfile`

*Dockerfile*
```
# Define base image
FROM centos

# Set environment variable default values
ENV HOSTNAME=localhost

# Define ports that container will use
EXPOSE 80

# Add files to the container
ADD file /path/in/container/file
COPY file /path/in/container/file

# Run commands during build
RUN yum update && \
    yum install nginx && \
    yum clean all

# Set entry point
ENTRYPOINT /bin/sh

# Set argument to entry point
CMD nginx -g 'daemon off;'
```

Each instruction of the `Dockerfile` adds a 'layer' to the container image. Layers can be reused and don't need to be rebuilt every time. When building a custom container, you will want to start with a container as close as possible to what you need. Then add each instruction in the order from less likely to change to most likely, this will minimize the number of times your container will need to be rebuilt.

### Save to git
Time to save our progress!
```bash
git add .
git commit -m "Adding custom docker file"
git push

```