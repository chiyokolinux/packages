#!/bin/sh
mkdir -vp ${DESTDIR}/usr/bin
install -v -m755 await "${DESTDIR}/usr/bin"
