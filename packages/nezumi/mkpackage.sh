#!/bin/bash
echo "[     nezumi     ] updating nezumi..."

# fetch latest github release version
PKG_VERSION=$(curl -s "https://api.github.com/repos/chiyokolinux/nezumi/releases/latest" | grep tag_name | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[     nezumi     ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/nezumi/package.conf

echo "[     nezumi     ] updated package nezumi to version ${PKG_VERSION}"
