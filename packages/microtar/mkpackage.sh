#!/bin/bash
echo "[    microtar    ] updating microtar..."

# fetch latest github commit version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/rxi/microtar/commits/master" | grep " *\"sha\":" | head -n1 | sed -E 's/^.*: ?\"([0-9a-fA-F]+)\",?/\1/' | cut -c-8)

echo "[    microtar    ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/microtar/package.conf

echo "[    microtar    ] updated package microtar to version ${PKG_VERSION}"
