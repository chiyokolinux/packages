#!/bin/bash
# typo intentional, name had to be shortened
echo "[ wp-gruvbxlight ] updating wallpaper-gruvbox-light..."

# fetch latest github package archive
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/chiyokolinux/packages/contents/packages/wallpaper-gruvbox-light/archives" | grep name | sed -E 's/^.*: ?\"[a-zA-Z\-]*\-([0-9\.\-]+)\.tar\.[gxb]z2?\",?/\1/' | tail -n1)

echo "[ wp-gruvbxlight ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/wallpaper-gruvbox-light/package.conf

echo "[ wp-gruvbxlight ] updated package wallpaper-gruvbox-light to version ${PKG_VERSION}"
