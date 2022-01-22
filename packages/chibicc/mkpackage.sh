#!/bin/bash
echo "[    chibicc     ] updating chibicc..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/rui314/chibicc/commits/main" | grep " *\"sha\":" | head -n1 | sed -E 's/^.*: ?\"([0-9a-fA-F]+)\",?/\1/' | cut -c-8)

echo "[    chibicc     ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/chibicc/package.conf

echo "[    chibicc     ] updated package chibicc to version ${PKG_VERSION}"
