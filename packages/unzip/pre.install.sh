 #!/bin/bash
wget http://www.linuxfromscratch.org/patches/blfs/9.1/unzip-6.0-consolidated_fixes-1.patch
patch -Np1 -i ../unzip-6.0-consolidated_fixes-1.patch
