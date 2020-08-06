FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -S --noprogressbar --noconfirm \
    nodejs npm yarn \
    && \
    bash -c "yes | sudo pacman -Scc"

ENTRYPOINT /bin/bash -l
