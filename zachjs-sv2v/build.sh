#! /bin/bash

set -e
set -x

#cp -r $PREFIX/lib/* $PREFIX/x86_64-conda-linux-gnu/sysroot/usr/lib/
#cp -r $PREFIX/lib64/* $PREFIX/x86_64-conda-linux-gnu/sysroot/usr/lib64/

#export GMP_LIB_DIRS="$PREFIX/lib"
#export GMP_INCLUDE_DIRS="$PREFIX/include"
make
install -D bin/sv2v $PREFIX/bin/zachjs-sv2v

