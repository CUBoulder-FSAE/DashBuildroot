#!/bin/bash
#Author: Dylan Bomgardner
set -e
set -x

BR_DIR="$(pwd)/buildroot"
BR2_EXTERNAL="$(pwd)/fsae_dash"
DEFCONFIG_NAME="fsae_dash_defconfig"
OUTPUT_DIR="$(pwd)/buildroot"
BUILD_DIR="$(pwd)/build"

# Create the build dir
mkdir -p "BUILD_DIR"

# run savedefconfig command do save changes from menuconfig
echo "Running menuconfig"
pushd $BR_DIR > /dev/null
# Run defconfig first before menuconfig so it modifies the correct config
make BR2_EXTERNAL="$BR2_EXTERNAL" $DEFCONFIG_NAME

# Build
make
popd > /dev/null

cp "$BUILDROOT_DIR/output/images/"*.img "$CUSTOM_OUTPUT_DIR" || true
cp "$BUILDROOT_DIR/output/images/"*.tar.gz "$CUSTOM_OUTPUT_DIR" || true

echo -e "\e[32mBuild Succeeded.\e[0m"