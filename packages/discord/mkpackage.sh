#!/bin/bash
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
ar xf discord.deb
tar xf control.tar.gz
mv postinst post.install.sh
PKGVERSION=$(grep "Version:" control | sed 's/Version://g' | sed 's/ //g')
mv data.tar.gz archives/discord-${PKGVERSION}.tar.gz
cat <<EOF > package.conf
NAME=discord
DESCRIPTION=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
VERSION=${PKGVERSION}
MAINTAINER=Jonas Jaguar <jonasjaguar@jagudev.net>
DEPENDS=glibc alsa-lib gcc gconf libnotify nspr nss libstdc++ xorg-lib libindicator llvm
CONFLICTS=
CONFIGURECMD=
CONFIGUREOPTS=
TYPE=binary
SEPBUILD=no
UNINSTALLCMD=
LICENSE=OTHER
EOF
rm control.tar.gz control debian-binary discord.deb
