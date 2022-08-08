#!/bin/bash
echo "[     sbfi1      ] updating sbfi1..."

# no further updates will be released for sbfi1, probably
# if yes though, i'll just update this manually
PKG_VERSION="0324de6a9f"

echo "[     sbfi1      ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-f]*$/VERSION=${PKG_VERSION}/gm" packages/sbfi1/package.conf

echo "[     sbfi1      ] updated package sbfi1 to version ${PKG_VERSION}"
