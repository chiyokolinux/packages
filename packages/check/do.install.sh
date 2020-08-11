#!/bin/bash
make docdir=/usr/share/doc/check-0.14.0 install &&
sed -i '1 s/tools/usr/' /usr/bin/checkmk
