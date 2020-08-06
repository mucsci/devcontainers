# VSCode Devcontainers for MUCS

Maintainer: [Will Killian](https://www.github.com/willkill07)

### How to use

The `project-templates` directory contains folders for appropriate languages/platforms

Containers have already been built and pushed onto Docker Hub

1. Install Visual Studio Code
2. Install the "Remote - Containers" Extension
   - If Running *Windows*, ensure you are running Windows 10 and have the latest updates. You will also need to install Docker Desktop 2.2 or newer. Follow directions [here](https://docs.docker.com/docker-for-windows/wsl/)
   - If Running *macOS*, ensure you have Docker Desktop 2.0 or newer. If you have `brew` installed, you can simply say `brew cask install docker`
   - If Running *Linux*, you need to install `Docker` and `docker-compose` -- ensure that your user is added to the docker group.
3. To try out a given container, open a `project-template` folder in VS Code. You should be prompted to open the folder in a container. VS Code will automatically download the image and configure it.

### Features

- ArchLinux base image
- `autolab` CLI submission program for Millersville CS preinstalled (for remote submission)
- Preconfigured extensions for languages

### Questions / Comments / Concerns / Bugs

File an Issue on this repo
