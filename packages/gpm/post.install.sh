#!/bin/bash
cat > /etc/sysconfig/mouse << "EOF"
# Begin /etc/sysconfig/mouse

MDEVICE="<yourdevice>"
PROTOCOL="<yourprotocol>"
GPMOPTS="<additional options>"

# End /etc/sysconfig/mouse
EOF
