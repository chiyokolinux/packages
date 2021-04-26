#!/bin/bash
echo "[    destlink    ] updating destlink..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/chiyokolinux/destlink/releases/latest" | grep tag_name | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[    destlink    ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/destlink/package.conf

echo "[    destlink    ] updated package destlink to version ${PKG_VERSION}"
