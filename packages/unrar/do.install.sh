#!/bin/bash
mkdir -vp "${DESTDIR}/usr/bin"
install -v -m755 unrar "${DESTDIR}/usr/bin"
