 #!/bin/bash
wget https://github.com/cracklib/cracklib/releases/download/v2.9.7/cracklib-words-2.9.7.bz2
sed -i '/skipping/d' util/packer.c &&
