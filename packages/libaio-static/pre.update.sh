#!/bin/bash
sed -i '/install.*libaio.so/s/^/#/' src/Makefile
