FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -S --noprogressbar --noconfirm \
    jdk-openjdk openjdk-src openjdk-doc ant maven junit \
    && \
    bash -c "yes | sudo pacman -Scc" \

ENTRYPOINT /bin/bash -l
