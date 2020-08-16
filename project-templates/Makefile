FOLDERS := ai  cpp  dlang  dotnet  gfx  java  javascript  lisp  ocaml  python  ruby  swift
ZIP_FILES := $(FOLDERS:=.zip)

.PHONY: all clean


all : $(ZIP_FILES)

%.zip : %
	zip -r $@ $<
