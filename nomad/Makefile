TOPDIR := $(abspath $(lastword $(MAKEFILE_LIST))/../..)

.PHONY: all clean dep test build deploy release
all: test build

include $(TOPDIR)/ansible/ansible.mk
include $(TOPDIR)/docker/docker.mk

clean: docker-clean ansible-clean

dep: docker-dep ansible-dep

test: docker-test ansible-test

build: docker-build ansible-build

deploy: docker-deploy ansible-deploy

release: docker-release ansible-release
