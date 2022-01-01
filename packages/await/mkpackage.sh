#!/bin/bash
echo "[      ssu       ] updating ssu..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/illiliti/ssu/tags" | grep " *\"name\":" | head -n1 | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[      ssu       ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/ssu/package.conf

echo "[      ssu       ] updated package ssu to version ${PKG_VERSION}"
