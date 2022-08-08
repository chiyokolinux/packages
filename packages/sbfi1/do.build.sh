#!/bin/sh
cc -O2 $CFLAGS -o _sbfi1 sbfi.c $LDFLAGS
cc -O2 $CFLAGS -o _sbfi_file1 sbfi_file.c $LDFLAGS
cat > sbfi1 << "EOF"
#!/bin/sh

if [ -z "$1" ]
then
    ../lib64/sbfi1/_sbfi1
else
    ../lib64/sbfi1/_sbfi1_file "$1"
fi
EOF
