.PHONY : all changed

SHELL := /bin/bash

ALL_IMAGES =
ALL_IMAGES += base
ALL_IMAGES += cpp python
ALL_IMAGES += java dotnet lisp ocaml dlang swift ruby javascript
ALL_IMAGES += ai gfx

REPO = mucsci

TAGS ?=
TAGS += $(shell date "+%Y-%m-%d")
TAGS += latest

ACTION ?= analyze

ifeq ($(ACTION), full)
CHANGED = $(ALL_IMAGES)
else
CHANGED ?= $(shell comm -1 <(echo $(ALL_IMAGES) | tr ' ' '\n' | sort) <(git diff --name-only HEAD HEAD~1 | grep Dockerfile | xargs -I{} dirname {} | xargs -I{} basename {} | tr ' ' '\n' | sort))
endif

changed : $(CHANGED)

all : $(ALL_IMAGES)

ifeq ($(ACTION), full)
arch :
	docker pull archlinux/base
else
arch :
	echo "Using predownloaded archlinux/base"
endif

ifeq ($(ACTION), full)

ai : python
gfx : cpp
java lisp dotnet python cpp ocaml dlang swift ruby javascript : base
base : arch

% :
	$(eval NEW_ACTION=$(shell echo $(CHANGED) | gsed -r 's/\b/|/g' | grep -q "|$@|" && echo "build" || echo "pull"))
	make MAKEFLAGS=$(MAKEFLAGS) ACTION=$(NEW_ACTION) $@

endif

ifeq ($(ACTION), analyze)

ai : python
gfx : cpp
java lisp dotnet python cpp ocaml dlang swift ruby javascript : base
base : arch

% :
	$(eval NEW_ACTION=$(shell echo $(CHANGED) | gsed -r 's/\b/|/g' | grep -q "|$@|" && echo "build" || echo "pull"))
	make MAKEFLAGS=$(MAKEFLAGS) ACTION=$(NEW_ACTION) $@

else ifeq ($(ACTION), build)

% :
	DOCKER_BUILDKIT=1 docker build -t temporary_image -f ./docker/$@/Dockerfile ./docker/$@
	$(foreach TAG, $(TAGS), docker tag temporary_image $(REPO)/$@:$(TAG) ; )
	docker rmi temporary_image
	$(foreach TAG, $(TAGS), docker push $(REPO)/$@:$(TAG) ; )

else ifeq ($(ACTION), pull)

% :
	$(foreach REPO, $(REPOS), docker pull $(REPO)/$@:latest ; )

endif
