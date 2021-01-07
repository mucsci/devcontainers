FROM archlinux/base
MAINTAINER Will Killian <william.killian@millersville.edu>

ADD autolab /usr/local/bin/
ADD add_user.sh /tmp

RUN /tmp/add_user.sh user password \
    && \
    sed -i '1s;^;Server = http://mirrors.rutgers.edu/archlinux/$repo/os/$arch\nServer = https://mirrors.rutgers.edu/archlinux/$repo/os/$arch\n;' /etc/pacman.d/mirrorlist \
    && \
    pacman -Syu --noconfirm \
    && \
    pacman -S --noprogressbar --noconfirm \
    emacs-nox vim nano \
    base-devel \
    curl wget git unzip rsync openssh mosh man-db \
    && \
    bash -c 'yes | pacman -Scc' \
    && \
    rm -rf /home/user/.cache \
    && \
    /usr/bin/ssh-keygen -A \
    && \
    sed -i -e 's/^UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

USER user

WORKDIR /home/user

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
