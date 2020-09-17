#!/bin/bash 
make
make javahl
make swig-pl
make swig-py \
     swig_pydir=/usr/lib/python3.8/site-packages/libsvn \
     swig_pydir_extra=/usr/lib/python3.8/site-packages/svn
make swig-rb
