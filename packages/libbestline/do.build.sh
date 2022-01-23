#!/bin/sh
cat > dummy.c <<EOF
#include <stddef.h>
#include "bestline.h"
#include "bestline.c"
EOF

gcc dummy.c -fPIC -shared -o libbestline.so -O2 -I.
