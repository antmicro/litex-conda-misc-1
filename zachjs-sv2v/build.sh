#! /bin/bash

set -e
set -x

make
install -D bin/sv2v $PREFIX/bin/zachjs-sv2v

