#!/bin/bash
echo "[    wp-logo     ] updating wallpaper-logo..."

# fetch latest github package archive
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/chiyokolinux/packages/contents/packages/wallpaper-logo/archives" | grep name | sed -E 's/^.*: ?\"[a-zA-Z\-]*\-([0-9\.\-]+)\.tar\.[gxb]z2?\",?/\1/' | tail -n1)

echo "[    wp-logo     ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/wallpaper-logo/package.conf

echo "[    wp-logo     ] updated package wallpaper-logo to version ${PKG_VERSION}"
