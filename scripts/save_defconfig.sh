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

# Copy to the external tree
echo "Copying defconfig to fsae_dash"
cp $BR_DIR/output/defconfig "$BR2_EXTERNAL/board/fsae_dash/$DEFCONFIG_NAME" || {
    # Fail no defconfig file exists
    echo -e "\e[31mMake changes in menuconfig before running this\e[0m"
    exit 1
}

# Success
echo -e "\e[32mdefconfig updated: $BR2_EXTERNAL/board/fsae_dash/$DEFCONFIG_NAME\e[0m"