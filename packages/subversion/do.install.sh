#!/bin/bash
make install

make install-swig-pl
make install-swig-py \
      swig_pydir=/usr/lib/python3.8/site-packages/libsvn \
      swig_pydir_extra=/usr/lib/python3.8/site-packages/svn
make install-swig-rb
