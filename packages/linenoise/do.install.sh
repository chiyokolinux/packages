#!/bin/sh
mkdir -vp ${DESTDIR}/usr/include/encodings
install -v -m644 linenoise.h ${DESTDIR}/usr/include
install -v -m644 encodings/utf8.h ${DESTDIR}/usr/include/encodings
