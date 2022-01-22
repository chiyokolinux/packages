#!/bin/sh
mkdir -vp ${DESTDIR}/boot
install -v -m644 sectorlisp "${DESTDIR}/boot"
