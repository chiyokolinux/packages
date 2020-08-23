#!/bin/bash
make install &&
chown -v -R root:root /usr/share/emacs/26.3 &&
rm -vf /usr/lib/systemd/user/emacs.service
