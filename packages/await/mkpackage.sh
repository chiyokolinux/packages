#!/bin/bash
echo "[     await      ] updating await..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/slavaGanzin/await/tags" | grep " *\"name\":" | head -n1 | sed -E 's/^.*: ?\"v?([0-9\.\-]+)\",?/\1/')

echo "[     await      ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/await/package.conf

echo "[     await      ] updated package await to version ${PKG_VERSION}"
