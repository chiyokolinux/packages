#!/bin/bash
make docdir=/usr/share/doc/db-5.3.28 install 

chown -v -R root:root                         \
      ${DESTDIR}/usr/bin/db_*                 \
      ${DESTDIR}/usr/include/db{,_185,_cxx}.h \
      ${DESTDIR}/usr/lib/libdb*.{so,la}       \
      ${DESTDIR}/usr/share/doc/db-5.3.28
