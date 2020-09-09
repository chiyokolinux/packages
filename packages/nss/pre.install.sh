 #!/bin/bash
wget http://www.linuxfromscratch.org/patches/blfs/10.0/nss-3.55-standalone-1.patch
patch -Np1 -i ../nss-3.55-standalone-1.patch
cd nss
