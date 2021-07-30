#!/bin/bash
# typo intentional, name had to fit
echo "[ wp-lightbubble ] updating wallpaper-lightbubbles..."

# fetch latest github package archive
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/chiyokolinux/packages/contents/packages/wallpaper-lightbubbles/archives" | grep name | sed -E 's/^.*: ?\"[a-zA-Z\-]*\-([0-9\.\-]+)\.tar\.[gxb]z2?\",?/\1/' | tail -n1)

echo "[ wp-lightbubble ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/wallpaper-lightbubbles/package.conf

echo "[ wp-lightbubble ] updated package wallpaper-lightbubbles to version ${PKG_VERSION}"
