#!/bin/bash
echo "[  libmicrotar   ] updating libmicrotar..."

# just follow main microtar package version
PKG_VERSION=$(grep -o "^VERSION=[0-9a-fA-F\.\-]*$" packages/microtar/package.conf | sed "s/VERSION=//")

echo "[  libmicrotar   ] found version ${PKG_VERSION}, updating package.conf..."

sed -i "s/^VERSION=[0-9a-fA-F\.\-]*$/VERSION=${PKG_VERSION}/gm" packages/libmicrotar/package.conf

echo "[  libmicrotar   ] updated package libmicrotar to version ${PKG_VERSION}"
