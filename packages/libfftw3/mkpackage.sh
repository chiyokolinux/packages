#!/bin/bash
echo "[    libfftw3    ] updating libfftw3"

# fetch latest fftw.org (3.x.x) release version
PKG_VERSION=$(curl -s "https://www.fftw.org/download.html" | grep -o "fftw-3\.[0-9]\+\.[0-9]\+\.tar.gz" | uniq | sort | tail -n1 | grep -o "3\.[0-9]\+\.[0-9]\+")

echo "[    libfftw3    ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/libfftw3/package.conf

echo "[    libfftw3    ] updated package libfftw3 to version ${PKG_VERSION}"
