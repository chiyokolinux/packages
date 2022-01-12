#!/bin/bash
echo "[    chadstr     ] updating chadstr..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/skullchap/chadstr/commits/master" | grep " *\"sha\":" | head -n1 | sed -E 's/^.*: ?\"([0-9a-fA-F]+)\",?/\1/' | cut -c-8)

echo "[    chadstr     ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/chadstr/package.conf

echo "[    chadstr     ] updated package chadstr to version ${PKG_VERSION}"
