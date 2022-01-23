#!/bin/bash
echo "[      gti       ] updating gti..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/rwos/gti/tags" | grep " *\"name\":" | head -n1 | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[      gti       ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/gti/package.conf

echo "[      gti       ] updated package gti to version ${PKG_VERSION}"
