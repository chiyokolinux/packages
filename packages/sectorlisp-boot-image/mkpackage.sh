#!/bin/bash
echo "[ sectorlisp-b-i ] updating sectorlisp-boot-image..."

# just follow main sectorlisp package version
PKG_VERSION=$(grep -o "^VERSION=[0-9a-fA-F\.\-]*$" packages/sectorlisp/package.conf | sed "s/VERSION=//")

echo "[ sectorlisp-b-i ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/sectorlisp-boot-image/package.conf

echo "[ sectorlisp-b-i ] updated package sectorlisp-boot-image to version ${PKG_VERSION}"
