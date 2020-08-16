FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -Syu --noprogressbar --noconfirm \
    yay valgrind python2 \
    &&\
    yay -S --needed --noprogressbar --noconfirm \
    swift-bin \
    && \
    bash -c "pacman -Qdtq | sudo pacman -Rns --noconfirm -" \
    && \
    bash -c "yes | yay -Scc"

ENTRYPOINT /bin/bash -l
