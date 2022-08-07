#!/bin/sh
mkdir -vp "${DESTDIR}/usr/bin"
mkdir -vp "${DESTDIR}/usr/share/man"
install -v -m755 sex "${DESTDIR}/usr/bin"
install -v -m644 sex.6 "${DESTDIR}/usr/share/man"
