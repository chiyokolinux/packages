#!/bin/bash
make install                      &&
mv -v /usr/lib/libcrack.so.* /lib &&
cp -vf ../../lib/$(readlink /usr/lib/libcrack.so) /usr/lib/libcrack.so

install -v -m644 -D    ../cracklib-words-2.9.7.bz2 \
                         /usr/share/dict/cracklib-words.bz2    &&

bunzip2 -v               /usr/share/dict/cracklib-words.bz2    &&
ln -v -sf cracklib-words /usr/share/dict/words                 &&
echo $(hostname) >>      /usr/share/dict/cracklib-extra-words  &&
install -v -m755 -d      /lib/cracklib                         &&

create-cracklib-dict     /usr/share/dict/cracklib-words \
                         /usr/share/dict/cracklib-extra-words
