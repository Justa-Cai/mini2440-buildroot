#!/bin/sh
set -e 
[ ! -f .config ] && cp -av mini2440_defconfig .config
make 
