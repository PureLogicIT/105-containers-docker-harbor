#!/bin/bash
docker rm -f nginx
docker rm -f wordpress
docker rm -f mysql
docker volume rm wordpress
docker network rm my_net
