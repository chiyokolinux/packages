#!/bin/bash
echo "[    ichirou     ] updating ichirou..."

# fetch latest github release version
PKG_VERSION=$(curl -s "https://api.github.com/repos/chiyokolinux/ichirou/releases/latest" | grep tag_name | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[    ichirou     ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/ichirou/package.conf

echo "[    ichirou     ] updated package ichirou to version ${PKG_VERSION}"
