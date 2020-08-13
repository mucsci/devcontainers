FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -Syu --noprogressbar --noconfirm \
    nodejs npm yarn \
    && \
    bash -c "yes | sudo pacman -Scc"

ENV PATH="/home/user/.yarn/bin:/home/user/node_modules/.bin:$PATH"

ENTRYPOINT /bin/bash -l
