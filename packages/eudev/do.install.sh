#!/bin/bash
mkdir -pv /lib/udev/rules.d
mkdir -pv /etc/udev/rules.d
make install
tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install
