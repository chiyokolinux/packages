#!/bin/bash
mkdir -vp ${DESTDIR}/usr/lib/pkgconfig
make -C libelf install
install -vm644 config/libelf.pc "${DESTDIR}/usr/lib/pkgconfig"
rm "${DESTDIR}/usr/lib/libelf.a"
