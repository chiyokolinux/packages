#!/bin/sh
mkdir -vp "${DESTDIR}/usr/bin"
mkdir -vp "${DESTDIR}/usr/lib64/sbfi1"
install -v -m755 sbfi1 "${DESTDIR}/usr/bin"
install -v -m755 _sbfi1 _sbfi1_file "${DESTDIR}/usr/lib64/sbfi1"
