#!/bin/bash
cd ..
tar -xf speexdsp-1.2.0.tar.gz
cd speexdsp-1.2.0 
./configure --prefix=/usr    \
            --disable-static
            
make
make install
