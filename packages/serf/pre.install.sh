#!/bin/bash
sed -i "/Append/s:RPATH=libdir,::"          SConstruct
sed -i "/Default/s:lib_static,::"           SConstruct
sed -i "/Alias/s:install_static,::"         SConstruct
sed -i "/  print/{s/print/print(/; s/$/)/}" SConstruct
sed -i "/get_contents()/s/,/.decode()&/"    SConstruct
