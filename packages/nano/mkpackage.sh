#!/bin/bash
echo "[      nano      ] updating nano..."

# fetch latest nano-editor.org (v5) release version
PKG_VERSION=$(curl -s "https://www.nano-editor.org/dist/v5/" | grep -o "nano-[0-9].[0-9]*.tar.xz" | uniq | sort | tail -n1 | grep -o "[0-9]\.[0-9]*")

echo "[      nano      ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/nano/package.conf

echo "[      nano      ] updated package nano to version ${PKG_VERSION}"
