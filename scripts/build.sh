#!/bin/bash
#Author: Dylan Bomgardner
set -e

BUILD_SDK="$1"
BR_DIR="$(pwd)/buildroot"
BR2_EXTERNAL="$(pwd)/fsae_dash"
DEFCONFIG_NAME="fsae_dash_defconfig"
OUTPUT_DIR="$(pwd)/buildroot"
BUILD_DIR="$(pwd)/build"

# Create the build dir
mkdir -p "$BUILD_DIR"


echo "Building"
pushd $BR_DIR > /dev/null
# Run the defconfig pointing to our config
make BR2_EXTERNAL="$BR2_EXTERNAL" $DEFCONFIG_NAME

# Build command
if [ "${BUILD_SDK}" = "sdk" ]; then
    echo "Building SDK"
    make -j$(nproc) sdk
else
    make -j$(nproc)
    cp "$BUILDROOT_DIR/output/images/"*.img "$CUSTOM_OUTPUT_DIR" || true
    cp "$BUILDROOT_DIR/output/images/"*.tar.gz "$CUSTOM_OUTPUT_DIR" || true
fi

popd > /dev/null



echo -e "\e[32mBuild Succeeded.\e[0m"