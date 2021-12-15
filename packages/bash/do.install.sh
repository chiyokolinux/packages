#!/bin/bash
make install
mv -vf "${DESTDIR}/usr/bin/bash" "${DESTDIR}/bin"
