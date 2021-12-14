#!/bin/bash
mv -v ${DESTDIR}/usr/lib/libz.so.* "${DESTDIR}/lib"
ln -sfv "${DESTDIR}/lib/$(readlink "${DESTDIR}/usr/lib/libz.so")" "${DESTDIR}/usr/lib/libz.so"
