FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -S --noprogressbar --noconfirm \
    imagemagick \
    ocaml opam \
    && \
    bash -c "yes | sudo pacman -Scc" \
    && \
    sudo rm -rf /tmp/* /home/user/.cache \
    && \
    opam init --disable-sandboxing -a -y \
    && \
    opam install -y merlin utop ocp-indent ocp-index

ENTRYPOINT /bin/bash -l
