#!/bin/bash
make install
mv -v ${DESTDIR}/etc/bash_completion.d/grub ${DESTDIR}/usr/share/bash-completion/completions
