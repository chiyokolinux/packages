#!/bin/sh
install -Dv -m755 sex "${DESTDIR}/usr/bin"
install -Dv -m644 sex.6 "${DESTDIR}/usr/share/man"
