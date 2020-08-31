 #!/bin/bash
wget http://www.linuxfromscratch.org/patches/blfs/9.1/mesa-19.3.4-fix_svga_vmwgfx_segfaults-1.patch
patch -Np1 -i ../mesa-19.3.4-fix_svga_vmwgfx_segfaults-1.patch
wget http://www.linuxfromscratch.org/patches/blfs/9.1/mesa-19.3.4-add_xdemos-1.patch
patch -Np1 -i ../mesa-19.3.4-add_xdemos-1.patch

GALLIUM_DRV="auto"
DRI_DRIVERS="auto"
