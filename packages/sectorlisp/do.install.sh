#!/bin/sh
mkdir -vp ${DESTDIR}/usr/bin
mv -v lisp sectorlisp
install -v -m755 sectorlisp "${DESTDIR}/usr/bin"
