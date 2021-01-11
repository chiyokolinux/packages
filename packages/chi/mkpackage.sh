#!/bin/bash
echo "[      chi       ] updating chi..."

# fetch latest github release version
PKG_VERSION=$(curl -s "https://api.github.com/repos/chiyokolinux/chi/releases/latest" | grep tag_name | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[      chi       ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/chi/package.conf

echo "[      chi       ] updated package chi to version ${PKG_VERSION}"
