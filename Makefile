.PHONY : all

all : ai gfx java dotnet lisp cpp python base ocaml dlang swift ruby javascript

arch :
	docker pull archlinux/base
	touch $@

% : docker/%.Dockerfile
	docker build -t mucsci/$@ -f ./$< docker
	docker push mucsci/$@
	touch $@

ai : python
gfx : cpp
java lisp dotnet python cpp ocaml dlang swift ruby javascript : base
base : arch
