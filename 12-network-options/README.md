# 10 Docker local network options

There are several types of networks that can be created in docker:

```
From https://docs.docker.com/network/

Docker’s networking subsystem is pluggable, using drivers. Several drivers exist by default, and provide core networking functionality:

bridge: The default network driver. If you don’t specify a driver, this is the type of network you are creating. Bridge networks are usually used when your applications run in standalone containers that need to communicate. See bridge networks.

host: For standalone containers, remove network isolation between the container and the Docker host, and use the host’s networking directly. See use the host network.

overlay: Overlay networks connect multiple Docker daemons together and enable swarm services to communicate with each other. You can also use overlay networks to facilitate communication between a swarm service and a standalone container, or between two standalone containers on different Docker daemons. This strategy removes the need to do OS-level routing between these containers. See overlay networks.

ipvlan: IPvlan networks give users total control over both IPv4 and IPv6 addressing. The VLAN driver builds on top of that in giving operators complete control of layer 2 VLAN tagging and even IPvlan L3 routing for users interested in underlay network integration. See IPvlan networks.

macvlan: Macvlan networks allow you to assign a MAC address to a container, making it appear as a physical device on your network. The Docker daemon routes traffic to containers by their MAC addresses. Using the macvlan driver is sometimes the best choice when dealing with legacy applications that expect to be directly connected to the physical network, rather than routed through the Docker host’s network stack. See Macvlan networks.

none: For this container, disable all networking. Usually used in conjunction with a custom network driver. none is not available for swarm services. See disable container networking.
```

You can modify the docker networks that containers will connect to:

```
 docker network create \
  --driver=bridge \
  --subnet=172.28.0.0/16 \
  --ip-range=172.28.5.0/24 \
  --gateway=172.28.5.254 \
  br0
``` 

It can also be crated in compose:

```
ipam:
  driver: bridge
  config:
    - subnet: 172.28.0.0/16
      ip_range: 172.28.5.0/24
      gateway: 172.28.5.254
```



If a custom network is required for an application or service, then it can be attached to manually or through docker compose using the following:

```
services:
  # ...
networks:
  network1:
    name: my-pre-existing-network
    external: true
```
### Save to git
Time to save our progress!
```bash
git add .
git commit -m "editing compose and adding env and network"
git push

```


