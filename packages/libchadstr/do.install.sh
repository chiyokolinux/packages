#!/bin/sh
mkdir -vp ${DESTDIR}/usr/lib
make shared
mv ${DESTDIR}/usr/lib ${DESTDIR}/usr/lib64
