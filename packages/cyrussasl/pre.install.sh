#!/bin/bash
wget http://www.linuxfromscratch.org/patches/blfs/10.0/cyrus-sasl-2.1.27-doc_fixes-1.patch
patch -Np1 -i ../cyrus-sasl-2.1.27-doc_fixes-1.patch
