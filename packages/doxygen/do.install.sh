#!/bin/bash
make install &&
install -vm644 ../doc/*.1 /usr/share/man/man1
