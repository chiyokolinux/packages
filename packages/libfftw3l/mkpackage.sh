#!/bin/bash
echo "[    libfftw3l   ] updating libfftw3l..."

# just follow main libfftw3 package version
PKG_VERSION=$(grep -o "^VERSION=[0-9\.\-]*$" packages/libfftw3/package.conf | sed "s/VERSION=//")

echo "[    libfftw3l   ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/libfftw3l/package.conf

echo "[    libfftw3l   ] updated package libfftw3l to version ${PKG_VERSION}"
