#!/bin/sh
mkdir -vp ${DESTDIR}/usr/bin
install -v -m755 minilisp "${DESTDIR}/usr/bin"
