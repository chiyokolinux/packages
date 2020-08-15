#!/bin/bash
make install
make install-private-headers
ln -v -sf tclsh8.6 /usr/bin/tclsh
chmod -v 755 /usr/lib/libtcl8.6.so
