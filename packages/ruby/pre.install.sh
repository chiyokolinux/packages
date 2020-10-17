#!/bin/bash
wget http://www.linuxfromscratch.org/patches/blfs/10.0/ruby-2.7.1-glibc_fix-1.patch
patch -Np1 -i ../ruby-2.7.1-glibc_fix-1.patch
