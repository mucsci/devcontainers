FROM mucsci/cpp
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN sudo pacman -Syu --noprogressbar --noconfirm \
    imagemagick tk tcl fontconfig \
    freeglut glew glu mesa assimp glm emscripten sdl2 sdl2_gfx sdl2_image sdl2_ttf \
    && \
    bash -c "yes | sudo pacman -Scc"

ENTRYPOINT /bin/bash -l
