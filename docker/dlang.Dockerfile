FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -S --noprogressbar --noconfirm \
    dfmt dcd dmd dscanner dub libphobos dtools \
    ldc liblphobos valgrind \
    yay \
    && \
    yay -S --needed --noconfirm \
    lldb-mi serve-d \
    && \
    bash -c "yes | yay -Scc"

ENTRYPOINT /bin/bash -l
