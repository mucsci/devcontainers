FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -S --noprogressbar --noconfirm \
    dotnet-sdk dotnet-host \
    && \
    bash -c "yes | sudo pacman -Scc"

ENTRYPOINT /bin/bash -l
