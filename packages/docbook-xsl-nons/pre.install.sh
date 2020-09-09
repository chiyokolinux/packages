#!/bin/bash
wget http://www.linuxfromscratch.org/patches/blfs/9.1/docbook-xsl-nons-1.79.2-stack_fix-1.patch
patch -Np1 -i ../docbook-xsl-nons-1.79.2-stack_fix-1.patch
