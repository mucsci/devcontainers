FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -Syu --noprogressbar --noconfirm \
    ruby-rdoc ruby-docs ruby-irb ruby \
    && \
    bash -c "yes | sudo pacman -Scc"

ENV PATH="/home/user/.gem/ruby/2.7.0/bin:$PATH"

ENTRYPOINT /bin/bash -l
