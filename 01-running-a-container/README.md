# 01 Running a Container

## Running a basic container

We'll start with running a basic container with no options. The below commands runs an `NGINX` container locally. You'll see the logs from that container on your console

```
docker run nginx
```

If you open a new terminal. We can look at the status of the conatiner to confirm it's running

```
docker ps
```

Each container is assigned a unique ID, you can call conatiners by name or ID. Since we didn't specify a name, you'll notice that docker gave the conatiner a random generated name. In this example `cool_hellman`. 
```
CONTAINER ID   IMAGE               COMMAND                  CREATED         STATUS         PORTS                       NAMES
73bccad23180   nginx               "/docker-entrypoint.…"   4 seconds ago   Up 3 seconds   80/tcp                      cool_hellman
```
To get more in depth details about the running container we can run an `inspect`.

You can name a container something more identifiable


```
docker run --name my_container nginx
```

```
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS                       NAMES
1ccf73e80c7f   nginx            "/docker-entrypoint.…"   7 seconds ago   Up 5 seconds   80/tcp                      my_container
```

```
 docker inspect my_container
```
output:
```
[
    {
        "Id": "73bccad23180b3ce98c7bef0ae546bb65b7dd310ac29e920ec64848f773b0fa9",
        "Created": "2023-03-04T19:13:40.4630098Z",
        "Path": "/docker-entrypoint.sh",
        "Args": [
            "nginx",
            "-g",
            "daemon off;"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 5811,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2023-03-04T19:13:41.0932823Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:3f8a00f137a0d2c8a2163a09901e28e2471999fde4efc2f9570b91f1c30acf94",
        ...
        ...
        ...
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "8919d8d756eb0ff57831fdd42bf6d85adc1d295e9177330334a6e9bb839cb66c",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {
                "80/tcp": null
            },
            "SandboxKey": "/var/run/docker/netns/8919d8d756eb",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "4d44afee29889ef5a9d7c54c09d6ecd99f6aed651ea9bde98fa43c77ddfb924c",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "180ad842df028316c0109bd1985cdbffc623041e95bef9c964869a552f9ebecc",
                    "EndpointID": "4d44afee29889ef5a9d7c54c09d6ecd99f6aed651ea9bde98fa43c77ddfb924c",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:02",
                    "DriverOpts": null
                }
            }
        }
    }
]
```

Up to now the conatiners have locked our terminals. You'll more then likely want to run your containers in `detached` mode. This starts them in the background.

```
docker run -d nginx
```
