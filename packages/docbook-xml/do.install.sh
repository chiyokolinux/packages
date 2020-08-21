#!/bin/bash
install -v -d -m755 /usr/share/xml/docbook/xml-dtd-4.5
install -v -d -m755 /etc/xml
chown -R root:root . 
cp -v -af docbook.cat *.dtd ent/ *.mod \
    /usr/share/xml/docbook/xml-dtd-4.5
