#!bin/bash
cd ../..
wget http://www.linuxfromscratch.org/patches/lfs/9.1/glibc-2.31-fhs-1.patch
cd glibc-2.31
patch -Np1 -i ../glibc-2.31-fhs-1.patch
case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 /lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3
    ;;
esac
cd build
