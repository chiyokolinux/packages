#!/bin/bash
echo "[      kilo      ] updating kilo..."

# fetch latest github commit version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/antirez/kilo/commits/master" | grep " *\"sha\":" | head -n1 | sed -E 's/^.*: ?\"([0-9a-fA-F]+)\",?/\1/' | cut -c-8)

echo "[      kilo      ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/kilo/package.conf

echo "[      kilo      ] updated package kilo to version ${PKG_VERSION}"
