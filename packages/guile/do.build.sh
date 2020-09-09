#!/bin/bash 
make
make html

makeinfo --plaintext -o doc/r5rs/r5rs.txt doc/r5rs/r5rs.texi
makeinfo --plaintext -o doc/ref/guile.txt doc/ref/guile.texi
