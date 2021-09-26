#!/bin/bash
echo "[    libfftw3f   ] updating libfftw3f"

# just follow main libfftw3 package version
PKG_VERSION=$(grep -o "^VERSION=[0-9\.\-]*$" packages/libfftw3/package.conf | sed "s/VERSION=//")

echo "[    libfftw3f   ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/libfftw3f/package.conf

echo "[    libfftw3f   ] updated package libfftw3f to version ${PKG_VERSION}"
