---
title: "Docker: Introduction"
excerpt: "Guide to better understand docker containers"
header:
  image: "/assets/images/academy/docker.svg"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

# networking

https://docs.docker.com/network/network-tutorial-standalone/

Use user-defined bridge networks

docker network create --driver=bridge br0
--driver=bridge \
--subnet=172.28.0.0/16 \
--ip-range=172.28.5.0/24 \
--gateway=172.28.5.254 \
docker network ls

 docker network inspect bridge1


docker run -dit --name deb marcelofpfelix/debian:11 bash


  docker run -dit --name alpine1 --network bridge1 alpine ash
 docker network inspect bridge1


 docker container attach alpine1


  docker network rm docker1



  - name: create a docker network bridge
  docker_network:
    name: "{{ PRIV_NET.DOCKER_NET_NAME }}"
    driver_options:
      com.docker.network.bridge.name: "{{ PRIV_NET.BRIDGE_NAME }}"
      com.docker.network.driver.mtu: '1500'
      com.docker.network.bridge.enable_ip_masquerade: 'false'
    ipam_config:
      - subnet: "{{ PRIV_NET.PREFIX }}.0/{{ PRIV_NET.PRIV_ID }}"
        gateway: "{{ PRIV_NET.PREFIX }}.1"

```
docker network create \
--driver=bridge \
--subnet=172.18.0.0/16 \
--gateway=172.18.0.1 \
  bridge2

  docker network create \
  --driver=bridge \
  --subnet=10.0.1.0/24 \
  --gateway=10.0.1.1 \
    bridge3

```
