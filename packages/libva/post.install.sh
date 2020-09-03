#!/bin/bash
wget https://github.com/intel/intel-vaapi-driver/releases/download/2.4.1/intel-vaapi-driver-2.4.1.tar.bz2
tar -xvf ../intel-vaapi-driver-2.4.1.tar.bz2
cd intel-vaapi-driver-2.4.1
./configure $XORG_CONFIG
make
make install
