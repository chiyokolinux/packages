#!/bin/sh
sed -i -e '15 i #include <string.h>' sex.c
cc -O2 $CFLAGS -o sex sex.c $LDFLAGS
