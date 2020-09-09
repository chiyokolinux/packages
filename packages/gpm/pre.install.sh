#!/bin/bash
Device Drivers  --->
  Input device support ---> [CONFIG_INPUT]
    <*/M> Mouse interface   [CONFIG_INPUT_MOUSEDEV]
wget http://www.linuxfromscratch.org/patches/blfs/9.1/gpm-1.20.7-glibc_2.26-1.patch
sed -i -e 's:<gpm.h>:"headers/gpm.h":' src/prog/{display-buttons,display-coords,get-versions}.c &&
patch -Np1 -i ../gpm-1.20.7-glibc_2.26-1.patch
