# Install Alastria using Docker
If you want to test Alastria using Docker then you have two options.

## Alastria base image
I built a base Docker image with all common components for validator and regular nodes. You can build this image
executing the task `make build-base-image`. If you use a proxy, this task automatically uses it to build the image.
This can take a while.

## Install using Vagrant
Start the [`Vagrantfile`](Vagrantfile) of this repo to install all dependencies, `docker`, `make` etc.

```bash
$ vagrant up --provision-with shell
```
When done, go to the `/vagrant` directory and build the image

```bash
$ make build
```
The result image will be something like `alastria-node:0.1-31fdd47d00`, where `0.1` is the base version, and `31fdd47d00` is the
hash of the `Dockerfile`, so when the Dockerfile changes, it automatically rebuilds.

```bash
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alastria-base       latest              99c40f8fba36        About an hour ago   1.97GB
alastria-node       0.1-f0ac32baea      99c40f8fba36        About an hour ago   1.97GB
```

## Build `Dockerfile` and run Alastria
First build the base image

```bash
$ docker build -t alastria-base -f Dockerfile.base .
```
> **Tip** You can use `--build-arg http_proxy=` to pass your proxy config 

When done, build the alastria-node image
```bash
$ docker build -t alastria-node .
```
## Start shell in Alastria node
If you want to digg in the Alastria node, you can execute the task
```bash
$ make node-shell
```
If no image exists, first it create one, and then give you a fresh shell.