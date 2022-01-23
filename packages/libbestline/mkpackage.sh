#!/bin/bash
echo "[  libbestline   ] updating libbestline"

# just follow main bestline package version
PKG_VERSION=$(grep -o "^VERSION=[0-9a-fA-F\.\-]*$" packages/bestline/package.conf | sed "s/VERSION=//")

echo "[  libbestline   ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/libbestline/package.conf

echo "[  libbestline   ] updated package libbestline to version ${PKG_VERSION}"
