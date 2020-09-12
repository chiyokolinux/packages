#!/bin/bash
install -vm644 linear.h /usr/include
install -vm755 liblinear.so.3 /usr/lib
ln -sfv liblinear.so.3 /usr/lib/liblinear.so
