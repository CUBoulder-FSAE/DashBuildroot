#!/bin/bash
#Author: Dylan Bomgardner
set -e

BR_DIR="$(pwd)/buildroot"
BR2_EXTERNAL="$(pwd)/fsae_dash"
DEFCONFIG_NAME="fsae_dash_defconfig"

# run savedefconfig command do save changes from menuconfig
echo "Running savedefconfig"
pushd $BR_DIR >> /dev/null
make BR2_EXTERNAL="$BR2_EXTERNAL" savedefconfig
popd >> /dev/null

# Success
echo -e "\e[32mdefconfig updated: $BR2_EXTERNAL/board/fsae_dash/$DEFCONFIG_NAME\e[0m"