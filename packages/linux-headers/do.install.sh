#!/bin/bash
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include/* "${DESTDIR}/usr/include"
