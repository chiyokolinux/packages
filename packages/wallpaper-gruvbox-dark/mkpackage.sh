#!/bin/bash
echo "[ wp-gruvboxdark ] updating wallpaper-gruvbox-dark..."

# fetch latest github package archive
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/chiyokolinux/packages/contents/packages/wallpaper-gruvbox-dark/archives" | grep name | sed -E 's/^.*: ?\"[a-zA-Z\-]*\-([0-9\.\-]+)\.tar\.[gxb]z2?\",?/\1/' | tail -n1)

echo "[ wp-gruvboxdark ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/wallpaper-gruvbox-dark/package.conf

echo "[ wp-gruvboxdark ] updated package wallpaper-gruvbox-dark to version ${PKG_VERSION}"
