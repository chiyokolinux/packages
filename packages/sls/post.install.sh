#!/bin/bash
chown root:"$(id -gn)" /usr/bin/sls
chmod gu+s /usr/bin/sls
