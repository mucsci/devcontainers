#!/usr/bin/env bash
# this script sets up unattended aur access via yay for a user given as the first argument
set -o pipefail -e

if test -z "$1"
then
   echo "You must specify a user name"
   exit -1
fi

AUR_USER=$1
AUR_PASSWORD=$2

# create the user
useradd -m $AUR_USER

# set the user's password to blank
echo "${AUR_USER}:${AUR_PASSWORD}" | chpasswd -e

# give the aur user passwordless sudo powers
echo "$AUR_USER      ALL = NOPASSWD: ALL" >> /etc/sudoers

# use all possible cores for subsequent package builds
sed -i 's,#MAKEFLAGS="-j2",MAKEFLAGS="-j$(nproc)",g' /etc/makepkg.conf

# don't compress the packages built here
sed -i "s,PKGEXT='.pkg.tar.xz',PKGEXT='.pkg.tar',g" /etc/makepkg.conf

cat <<'EOF'>> /etc/pacman.conf


[arch4edu]
SigLevel = Never
Server = https://arch4edu.keybase.pub/$arch
EOF

echo "Packages from the AUR can now be installed like this:"
echo "su $AUR_USER -c 'yay -S --needed --noprogressbar --needed --noconfirm PACKAGE'"
