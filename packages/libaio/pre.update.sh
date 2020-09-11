#!/bin/bash
sed -i '/install.*libaio.a/s/^/#/' src/Makefile
