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

CHANGED := $(shell comm -1 <(echo $(ALL_IMAGES) | tr ' ' '\n' | sort) <(git diff --name-only HEAD HEAD~1 | grep Dockerfile | xargs -I{} basename {} .Dockerfile | tr ' ' '\n' | sort))

changed : $(CHANGED)

all : $(ALL_IMAGES)

ifeq ($(ACTION), update)
arch :
	docker pull archlinux/base
else
arch :
	echo "Using predownloaded archlinux/base"
endif

ifeq ($(ACTION), analyze)

ai : python
gfx : cpp
java lisp dotnet python cpp ocaml dlang swift ruby javascript : base
base : arch

% :
	@echo Analyzing $@
	$(eval ACTION=build$(shell echo $(CHANGED) | gsed -r 's/\b/|/g' | grep -c "|$@|"))
	@echo $(ACTION)
	make MAKEFLAGS=$(MAKEFLAGS) ACTION=$(ACTION) $@

else ifeq ($(ACTION), build1)

% :
	@echo Building $@
	DOCKER_BUILDKIT=1 docker build -t temporary_image -f ./docker/$@.Dockerfile ./docker/
	$(foreach TAG, $(TAGS), docker tag temporary_image $(REPO)/$@:$(TAG) ; )
	docker rmi temporary_image
	$(foreach TAG, $(TAGS), docker push $(REPO)/$@:$(TAG) ; )

else ifeq ($(ACTION), build0)

% :
	@echo Pulling $@
	$(foreach REPO, $(REPOS), docker pull $(REPO)/$@:latest ; )
	true

endif
