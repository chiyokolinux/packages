#!/bin/bash
echo "[   minimodem    ] updating minimodem..."

# fetch latest github release version
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/kamalmostafa/minimodem/tags" | grep " *\"name\":" | head -n1 | sed -E 's/^.*: ?\"(minimodem-)?([0-9\.\-]+)\",?/\2/' | sed -e 's/-1//')

echo "[   minimodem    ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/minimodem/package.conf

echo "[   minimodem    ] updated package minimodem to version ${PKG_VERSION}"
