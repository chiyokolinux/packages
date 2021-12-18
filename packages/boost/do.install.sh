#!/bin/bash
./b2 install threading=multi link=shared
ln -svf detail/sha1.hpp ${DESTDIR}/usr/include/boost/uuid/sha1.hpp
