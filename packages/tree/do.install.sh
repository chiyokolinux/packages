#!/bin/bash
make MANDIR=/usr/share/man/man1 install
chmod -v 644 /usr/share/man/man1/tree.1
