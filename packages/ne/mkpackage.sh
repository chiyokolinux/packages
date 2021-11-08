#!/bin/bash
echo "[       ne       ] updating ne..."

# fetch latest github tag version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/vigna/ne/tags" | grep " *\"name\":" | head -n1 | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[       ne       ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/ne/package.conf

echo "[       ne       ] updated package ne to version ${PKG_VERSION}"
