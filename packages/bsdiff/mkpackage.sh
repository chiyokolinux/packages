#!/bin/bash
echo "[    bsdiff      ] updating bsdiff..."

# fetch latest github package archive
PKG_VERSION=$(curl -s "https://api.github.com/repos/chiyokolinux/packages/contents/packages/bsdiff/archives" | grep name | sed -E 's/^.*: ?\"[a-zA-Z]*\-([0-9\.\-]+)\.tar\.[gxb]z2?\",?/\1/' | tail -n1)

echo "[    bsdiff      ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/bsdiff/package.conf

echo "[    bsdiff      ] updated package bsdiff to version ${PKG_VERSION}"
