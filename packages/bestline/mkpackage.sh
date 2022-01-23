#!/bin/bash
echo "[    bestline    ] updating bestline..."

# fetch latest github commit version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/jart/bestline/commits/master" | grep " *\"sha\":" | head -n1 | sed -E 's/^.*: ?\"([0-9a-fA-F]+)\",?/\1/' | cut -c-8)

echo "[    bestline    ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/bestline/package.conf

echo "[    bestline    ] updated package bestline to version ${PKG_VERSION}"
