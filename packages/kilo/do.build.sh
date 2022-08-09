#!/bin/sh
sed -i -e '55 i #include <stdint.h>' kilo.c
make
