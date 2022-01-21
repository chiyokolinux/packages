#!/bin/bash
echo "[   sectorlisp   ] updating sectorlisp..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/jart/sectorlisp/commits/main" | grep " *\"sha\":" | head -n1 | sed -E 's/^.*: ?\"([0-9a-fA-F]+)\",?/\1/' | cut -c-8)

echo "[   sectorlisp   ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/sectorlisp/package.conf

echo "[   sectorlisp   ] updated package sectorlisp to version ${PKG_VERSION}"
