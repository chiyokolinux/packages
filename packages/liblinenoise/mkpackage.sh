#!/bin/bash
echo "[  liblinenoise  ] updating liblinenoise..."

# just follow main linenoise package version
PKG_VERSION=$(grep -o "^VERSION=[0-9a-fA-F\.\-]*$" packages/linenoise/package.conf | sed "s/VERSION=//")

echo "[  liblinenoise  ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/liblinenoise/package.conf

echo "[  liblinenoise  ] updated package liblinenoise to version ${PKG_VERSION}"
