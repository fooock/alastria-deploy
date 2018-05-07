# base version target
base_version := 0.1

# Use a hash of the Dockerfile for the tag, so when the Dockerfile changes,
# it automatically rebuilds
build_version := $(shell sha256sum Dockerfile | head -c 10)

# version
VERSION ?= $(base_version)-$(build_version)

# proxy config
PROXY ?= ${HTTP_PROXY}

# Params
PARAMS ?= 

#    ___  ____    ___            _           _
#   / _ \/ ___|  |_ _|_ __   ___| |_   _  __| | ___
#  | | | \___ \   | || '_ \ / __| | | | |/ _` |/ _ \
#  | |_| |___) |  | || | | | (__| | |_| | (_| |  __/
#   \___/|____/  |___|_| |_|\___|_|\__,_|\__,_|\___|
#

# At this moment we only support linux OS
osinclude := linux.mk
include ./includes/$(osinclude)

#   _____                    _
#  |_   _|_ _ _ __ __ _  ___| |_ ___
#    | |/ _` | '__/ _` |/ _ \ __/ __|
#    | | (_| | | | (_| |  __/ |_\__ \
#    |_|\__,_|_|  \__, |\___|\__|___/
#                 |___/

build: build-base-image build-alastria

build-base-image:
	docker build --build-arg http_proxy=$(PROXY) -t alastria-base -f Dockerfile.base .

build-alastria: 
	docker build --build-arg http_proxy=$(PROXY) -t alastria-node:$(VERSION) .

node-shell: build
	docker run -it alastria-node:$(VERSION) bash -l

install:
	docker run  -p 9000:9000 -p 21000-21010:21000-21010/tcp -p 21000-21010:21000-21010/udp -p 22000-22010:22000-22010 \
	-d alastria-node:$(VERSION) bash -c "./start.sh $(PARAMS)"
