#!/bin/bash
wget http://www.linuxfromscratch.org/patches/lfs/9.1/bash-5.0-upstream_fixes-1.patch
patch -Np1 -i ../bash-5.0-upstream_fixes-1.patch
