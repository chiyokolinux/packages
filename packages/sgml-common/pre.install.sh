#!/bin/bash
wget http://www.linuxfromscratch.org/patches/blfs/9.1/sgml-common-0.6.3-manpage-1.patch
patch -Np1 -i ../sgml-common-0.6.3-manpage-1.patch &&
autoreconf -f -i
