#!/bin/sh
mkdir -vp ${DESTDIR}/usr/lib64
install -v -m644 libmicrotar.so ${DESTDIR}/usr/lib64
