#!/bin/bash
ln -sv vim ${DESTDIR}/usr/bin/vi
for L in  ${DESTDIR}/usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done
ln -sv ../vim/vim82/doc ${DESTDIR}/usr/share/doc/vim-8.2.0190

cat > ${DESTDIR}/etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1 

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF
vim -c ':options'
