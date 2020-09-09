#!/bin/bash
cd ../dist

install -v -m755 Linux*/lib/*.so              /usr/lib
install -v -m644 Linux*/lib/{*.chk,libcrmf.a} /usr/lib

install -v -m755 -d                           /usr/include/nss
cp -v -RL {public,private}/nss/*              /usr/include/nss
chmod -v 644                                  /usr/include/nss/*

install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} /usr/bin

install -v -m644 Linux*/lib/pkgconfig/nss.pc  /usr/lib/pkgconfig
