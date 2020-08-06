FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -S --noprogressbar --noconfirm \
    gcc clang openmp llvm cmake \
    boost catch2 gtest gmock \
    openmpi \
    ninja \
    gdb lldb valgrind cppcheck \
    yay \
    && \
    yay -S --needed --noprogressbar --noconfirm \
    lldb-mi \
    && \
    yay -S --noconfirm --nopgpfetch --mflags '--skippgpcheck --nocheck' \
    libc++ libc++abi libc++experimental \
    && \
    bash -c "yes | yay -Scc"

ENTRYPOINT /bin/bash -l
