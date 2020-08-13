#!/bin/bash
make install &&
chmod -v 755 /usr/lib/libpython2.7.so.1.0
install -v -dm755 /usr/share/doc/python-2.7.17 &&

tar --strip-components=1                     \
    --no-same-owner                          \
    --directory /usr/share/doc/python-2.7.17 \
    -xvf ../python-2.7.17-docs-html.tar.bz2 &&

find /usr/share/doc/python-2.7.17 -type d -exec chmod 0755 {} \; &&
find /usr/share/doc/python-2.7.17 -type f -exec chmod 0644 {} \;
