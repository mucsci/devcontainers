FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -S --noprogressbar --noconfirm \
    ruby-rdoc ruby-docs ruby-irb ruby \
    && \
    bash -c "yes | sudo pacman -Scc"

ENTRYPOINT /bin/bash -l
