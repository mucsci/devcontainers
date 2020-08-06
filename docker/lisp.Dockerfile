FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

ENV OLD_ROSWELL_HOME /home/user/.roswell
ENV NEW_ROSWELL_HOME /usr/local/share/roswell

RUN sudo pacman -S --noprogressbar --noconfirm \
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
    ros install ailisp/linedit ailisp/prepl ailisp/cl-lsp \
    && \
    sudo mkdir -p ${NEW_ROSWELL_HOME} \
    && \
    sudo rm -rf ${OLD_ROSWELL_HOME}/tmp \
    && \
    sudo mv ${OLD_ROSWELL_HOME}/* ${NEW_ROSWELL_HOME} \
    && \
    sudo chown -R root:root ${NEW_ROSWELL_HOME}

ENV ROSWELL_HOME /usr/local/share/roswell

ENTRYPOINT /bin/bash -l
