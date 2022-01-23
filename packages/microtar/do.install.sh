#!/bin/sh
mkdir -vp ${DESTDIR}/usr/include/
install -v -m644 src/microtar.h ${DESTDIR}/usr/include
