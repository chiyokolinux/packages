#!/bin/sh
cat > dummy.c <<EOF
#include <stddef.h>
#include "microtar.h"
#include "microtar.c"
EOF

gcc dummy.c -fPIC -shared -o libmicrotar.so -O2 -Isrc
