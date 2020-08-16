 #!/bin/bash
tar -xf ../clang-9.0.1.src.tar.xz -C tools
tar -xf ../compiler-rt-9.0.1.src.tar.xz -C projects

mv tools/clang-9.0.1.src tools/clang
mv projects/compiler-rt-9.0.1.src projects/compiler-rt
sed -e '/ipc_perm, mode/s|^|//|' \
    -i projects/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cc
