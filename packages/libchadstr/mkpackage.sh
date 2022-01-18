#!/bin/bash
echo "[   libchadstr   ] updating libchadstr..."

# just follow main chadstr package version
PKG_VERSION=$(grep -o "^VERSION=[0-9a-fA-F\.\-]*$" packages/chadstr/package.conf | sed "s/VERSION=//")

echo "[   libchadstr   ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/libchadstr/package.conf

echo "[   libchadstr   ] updated package libchadstr to version ${PKG_VERSION}"
