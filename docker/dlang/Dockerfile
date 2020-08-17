FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -Syu --noprogressbar --noconfirm \
    dfmt dcd dmd dscanner dub libphobos dtools \
    ldc liblphobos valgrind \
    yay \
    && \
    yay -S --needed --noconfirm \
    lldb-mi \
    && \
    wget https://github.com/Pure-D/serve-d/releases/download/v0.6.0/serve-d_0.6.0-linux-x86_64.tar.xz \
    && \
    tar xf serve-d_0.6.0-linux-x86_64.tar.xz \
    && \
    sudo mv serve-d /usr/bin/serve-d \
    && \
    bash -c "yes | yay -Scc"

ENTRYPOINT /bin/bash -l
