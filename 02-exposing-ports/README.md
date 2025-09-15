# 02 Exposing Ports

## Intro 

You'll notice in the last example it mentions port 80 for our nginx webserver. But if you actually try to talk to port 80 of your server it's not actually open.

```
CONTAINER ID   IMAGE               COMMAND                  CREATED         STATUS         PORTS                       NAMES
73bccad23180   nginx               "/docker-entrypoint.…"   4 seconds ago   Up 3 seconds   80/tcp                      cool_hellman
```
```
curl localhost:80
 curl: (7) Failed to connect to localhost port 80: Connection refused
```
That's because the container is only accessible on the bridge network shared by the containers.
```
docker network ls
  NETWORK ID     NAME      DRIVER    SCOPE
  180ad842df02   bridge    bridge    local
  442d45aab890   host      host      local
  5f026b68deaf   none      null      local
```

## Host network

If we want to reach the container externally, we need to open the port through the host network. There's 2 ways we can do that. The first is running the entire container on the host network.

```
docker run --network host nginx
```

```
curl localhost:80
  <!DOCTYPE html>
  <html>
  <head>
  <title>Welcome to nginx!</title>
  <style>
  html { color-scheme: light dark; }
  body { width: 35em; margin: 0 auto;
  font-family: Tahoma, Verdana, Arial, sans-serif; }
  </style>
  </head>
  <body>
  <h1>Welcome to nginx!</h1>
  <p>If you see this page, the nginx web server is successfully installed and
  working. Further configuration is required.</p>

  <p>For online documentation and support please refer to
  <a href="http://nginx.org/">nginx.org</a>.<br/>
  Commercial support is available at
  <a href="http://nginx.com/">nginx.com</a>.</p>

  <p><em>Thank you for using nginx.</em></p>
  </body>
  </html>
```
This works but isn't the best solution. We don't have a lot of control with this method, whatever port is open on the container is now accessible on the host and we can't limit them or redirect them.

## Port mapping

The second method is better. We can leave the container on the bridge network but pick and choose the ports to open to the public.

```
docker run -p 80 nginx
```

Now, in our second terminal, we can view the running containers. We'll see that docker mapped port 80 of the container to a random dynamic port on the host. In this case port `49153`

```
docker ps
  CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS          PORTS                                     NAMES
  9cd4faf5255b   nginx          "/docker-entrypoint.…"   4 seconds ago   Up 3 seconds    0.0.0.0:49153->80/tcp, :::49153->80/tcp   agitated_davinci
```

We can curl that port and see our website running.
```
curl localhost:49153
  <!DOCTYPE html>
  <html>
  <head>
  <title>Welcome to nginx!</title>
  <style>
  html { color-scheme: light dark; }
  body { width: 35em; margin: 0 auto;
  font-family: Tahoma, Verdana, Arial, sans-serif; }
  </style>
  </head>
  <body>
  <h1>Welcome to nginx!</h1>
  <p>If you see this page, the nginx web server is successfully installed and
  working. Further configuration is required.</p>

  <p>For online documentation and support please refer to
  <a href="http://nginx.org/">nginx.org</a>.<br/>
  Commercial support is available at
  <a href="http://nginx.com/">nginx.com</a>.</p>

  <p><em>Thank you for using nginx.</em></p>
  </body>
  </html>
```

We can also pick which host port to use instead of letting docker pick a random dynamic port.
```
docker run -p 8080:80 nginx
```

And now we see that the host port is 8080
```
docker ps
  CONTAINER ID   IMAGE      COMMAND                  CREATED          STATUS          PORTS                                   NAMES
  ac7f6ef4d2d0   nginx      "/docker-entrypoint.…"   11 seconds ago   Up 10 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   eager_morse
```
