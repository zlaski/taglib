#!/bin/bash -x

SCRIPT=`basename $0 .sh`
SCRIPT_DIR=$(realpath $(dirname $0))
pushd $SCRIPT_DIR

echo CMAKE_INSTALL_PREFIX=$CMAKE_INSTALL_PREFIX
echo BUILD_SHARED_LIBS=$BUILD_SHARED_LIBS

rm -rf .build || exit 1
mkdir -p .build || exit 1
cd .build

cmake --install-prefix $CMAKE_INSTALL_PREFIX --log-level=VERBOSE -DBUILD_SHARED_LIBS=$BUILD_SHARED_LIBS -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -G 'Unix Makefiles' .. || exit 1
make SHELL='/bin/bash -x' || exit 1
make install SHELL='/bin/bash -x' || exit 1

popd
