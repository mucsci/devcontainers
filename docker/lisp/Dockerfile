FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -Syu --noprogressbar --noconfirm \
    yay clisp \
    && \
    yay -S --needed --noprogressbar --noconfirm \
    roswell \
    && \
    bash -c "yes | yay -Scc" \
    && \
    ros install sbcl-bin \
    && \
    ros use sbcl-bin \
    && \
    ros install ailisp/linedit ailisp/prepl ailisp/cl-lsp

ENV PATH="/home/user/.roswell/bin:$PATH"

ENTRYPOINT /bin/bash -l
