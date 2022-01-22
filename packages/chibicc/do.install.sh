#!/bin/sh
mkdir -vp ${DESTDIR}/usr/bin
install -v -m755 stage2/chibicc "${DESTDIR}/usr/bin"
