#!/bin/bash
sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake
