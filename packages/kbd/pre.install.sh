#!/bin/bash
wget http://www.linuxfromscratch.org/patches/lfs/9.1/kbd-2.2.0-backspace-1.patch
patch -Np1 -i ../kbd-2.2.0-backspace-1.patch
sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
