#!/bin/bash
cat >> ${DESTDIR}/etc/shells << "EOF"
/bin/dash
EOF
