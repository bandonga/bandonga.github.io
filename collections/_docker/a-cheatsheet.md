---
title: "Docker: Introduction"
excerpt: "Guide to better understand docker containers"
header:
  image: "/assets/images/academy/docker.svg"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

# Docker Cheat Sheet

### Viewing, finding resources

```console
 ## List running Containers:
felix@bandonga:~$ docker ps
 ## List all Containers (Including stopped)
felix@bandonga:~$ docker ps -a
 ## Start a Container
felix@bandonga:~$ docker run --name asd sdfjkdskj/sdfdsafa
 ## List Images
felix@bandonga:~$ docker image list
 ## Build an Image
felix@bandonga:~$ docker build -t myapp:v1 .
 ## Connect to Shell of running Container
felix@bandonga:~$ docker exec -it intelligent_chebyshev bash
/etc/docker env files

sudo docker logs -t myapp

sudo docker ps | awk '{ print $NF }' | sort

  ## Removing all stopped containers
docker container prune
docker container ls -a --filter status=exited --filter status=created
docker image prune
docker image prune -a

sudo docker volume create cloudflared
sudo docker volume inspect cloudflared
sudo chown -R 65532:65532 /var/lib/docker/volumes/cloudflared/_data
sudo docker run -it --rm -v cloudflared:/home/nonroot/.cloudflared/ cloudflare/cloudflared tunnel login
docker run -it --rm -v cloudflared:/home/nonroot/.cloudflared/ cloudflare/cloudflared tunnel create my-tunnel
sudo vi /var/lib/docker/volumes/cloudflared/_data/config.yml
sudo docker run -v cloudflared:/home/nonroot/.cloudflared cloudflare/cloudflared tunnel route dns my-tunnel sip.bandonga.com
```

If you specify the --net=host option to the docker create or docker run commands, Docker uses the host's network stack for the container. The network configuration of the container is the same as that of the host and the container shares the service ports that are available to the host. This configuration does not provide any network isolation for a container.




```console
felix@bandonga:~$ sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

felix@bandonga:~$ sudo yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo
felix@bandonga:~$ sudo yum-config-manager --enable docker-ce-edge
felix@bandonga:~$ sudo yum-config-manager --enable docker-ce-test
felix@bandonga:~$ sudo yum install docker-ce
felix@bandonga:~$ sudo systemctl start docker
felix@bandonga:~$ sudo docker run hello-world

docker pull registery:5000/jenkins
```
