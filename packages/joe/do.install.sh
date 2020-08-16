#!/bin/bash
make install
install -vm 755 joe/util/{stringify,termidx,uniproc} /usr/bin
