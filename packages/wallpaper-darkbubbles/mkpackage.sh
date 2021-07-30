#!/bin/bash
echo "[ wp-darkbubbles ] updating wallpaper-darkbubbles..."

# fetch latest github package archive
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/chiyokolinux/packages/contents/packages/wallpaper-darkbubbles/archives" | grep name | sed -E 's/^.*: ?\"[a-zA-Z\-]*\-([0-9\.\-]+)\.tar\.[gxb]z2?\",?/\1/' | tail -n1)

echo "[ wp-darkbubbles ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/wallpaper-darkbubbles/package.conf

echo "[ wp-darkbubbles ] updated package wallpaper-darkbubbles to version ${PKG_VERSION}"
