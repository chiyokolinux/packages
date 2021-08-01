#!/bin/bash
echo "[   tty-clock    ] updating tty-clock..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/xorg62/tty-clock/tags" | grep " *\"name\":" | head -n1 | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[   tty-clock    ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/tty-clock/package.conf

echo "[   tty-clock    ] updated package tty-clock to version ${PKG_VERSION}"
