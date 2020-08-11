 #!/bin/bash
wget http://www.linuxfromscratch.org/patches/lfs/9.1/coreutils-8.31-i18n-1.patch
patch -Np1 -i ../coreutils-8.31-i18n-1.patch
sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk
