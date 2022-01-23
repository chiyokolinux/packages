#!/bin/sh
mkdir -vp ${DESTDIR}/usr/lib64
install -v -m644 libbestline.so ${DESTDIR}/usr/lib64
