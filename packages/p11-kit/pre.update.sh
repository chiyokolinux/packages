#!/bin/bash
sed '20,$ d' -i trust/trust-extract-compat.in
cat >> trust/trust-extract-compat.in << "EOF"
/usr/sbin/make-ca -f -g
EOF
