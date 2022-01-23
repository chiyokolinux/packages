#!/bin/bash
echo "[   linenoise    ] updating linenoise..."

# fetch latest github commit version
# use yhirose fork because utf8 support is cool
PKG_VERSION=$(curl -u "${GITHUB_USER_NAME}:${GITHUB_API_TOKEN}" -s "https://api.github.com/repos/yhirose/linenoise/commits/utf8-support" | grep " *\"sha\":" | head -n1 | sed -E 's/^.*: ?\"([0-9a-fA-F]+)\",?/\1/' | cut -c-8)

echo "[   linenoise    ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/linenoise/package.conf

echo "[   linenoise    ] updated package linenoise to version ${PKG_VERSION}"
