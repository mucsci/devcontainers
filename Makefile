.PHONY : all

# GitHub Packages
REPO := docker.pkg.github.com/mucsci/devcontainers
# DockerHub
# REPO := mucsci

TAG := $(shell date "+%Y-%m-%d")
# TAG := latest

all : ai gfx java dotnet lisp cpp python base ocaml dlang swift ruby javascript

arch :
	docker pull archlinux/base
	touch $@

% : docker/%.Dockerfile
	docker build -t $(REPO)/$@:$(TAG) -f ./$< docker
	docker push $(REPO)/$@:$(TAG)
	touch $@

ai : python
gfx : cpp
java lisp dotnet python cpp ocaml dlang swift ruby javascript : base
base : arch
