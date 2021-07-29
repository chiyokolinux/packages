#!/bin/bash
echo "[    neofetch    ] updating neofetch..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/dylanaraps/neofetch/releases/latest" | grep tag_name | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[    neofetch    ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/neofetch/package.conf

echo "[    neofetch    ] updated package neofetch to version ${PKG_VERSION}"
