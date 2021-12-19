#!/bin/bash

make install
mv -v ${DESTDIR}/usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} ${DESTDIR}/bin
mv -v ${DESTDIR}/usr/lib/liblzma.so.* ${DESTDIR}/lib
ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) ${DESTDIR}/usr/lib/liblzma.so
