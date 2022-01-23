#!/bin/sh
cat > dummy.c <<EOF
#include <stddef.h>
#include "linenoise.h"
#include "linenoise.c"
#include "encodings/utf8.h"
#include "encodings/utf8.c"
EOF

gcc dummy.c -fPIC -shared -o liblinenoise.so -O2 -I.
