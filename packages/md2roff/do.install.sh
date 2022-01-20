#!/bin/sh
mkdir -vp ${DESTDIR}/usr/bin
make PREFIX=/usr install
