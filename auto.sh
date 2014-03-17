#!/bin/sh
set -e 
[ ! -f .config ] && cp -av Tiny210_defconfig .config
make 
