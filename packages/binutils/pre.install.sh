#!/bin/bash
cd ..
sed -i '/@\tincremental_copy/d' gold/testsuite/Makefile.in
cd build
