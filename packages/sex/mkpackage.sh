#!/bin/bash
echo "[      sex       ] updating sex"

# fetch latest github release version
PKG_VERSION=$(curl -s "http://spatula.net/software/sex/" | grep -o "sex-[0-9]\+\.[0-9]\+\.tar.gz" | uniq | sort | tail -n1 | grep -o "[0-9]\+\.[0-9]\+")

echo "[      sex       ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/sex/package.conf

echo "[      sex       ] updated package sex to version ${PKG_VERSION}"
