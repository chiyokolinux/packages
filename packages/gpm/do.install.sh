#!/bin/bash
make install

install-info --dir-file=/usr/share/info/dir           \
             /usr/share/info/gpm.info

ln -sfv libgpm.so.2.1.0 /usr/lib/libgpm.so
install -v -m644 conf/gpm-root.conf /etc

make install-gpm
