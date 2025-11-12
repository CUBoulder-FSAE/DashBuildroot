#!/bin/bash
#Author: Dylan Bomgardner
set -e
set -x

BR_DIR="$(pwd)/buildroot"
BR2_EXTERNAL="$(pwd)/fsae_dash"
DEFCONFIG_NAME="fsae_dash_defconfig"

# run savedefconfig command do save changes from menuconfig
echo "Running menuconfig"
pushd $BR_DIR > /dev/null
# Run defconfig first before menuconfig so it modifies the correct config
make BR2_EXTERNAL="$BR2_EXTERNAL" $DEFCONFIG_NAME

# Run the menuconfig
make BR2_EXTERNAL="$BR2_EXTERNAL" menuconfig
popd > /dev/null
