#!/bin/bash
make install
mkdir -v ${DESTDIR}/usr/share/doc/gawk-5.0.1
cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} ${DESTDIR}/usr/share/doc/gawk-5.0.1
