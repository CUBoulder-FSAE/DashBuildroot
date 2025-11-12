# DashBuildroot
Buildroot repo that contains the build system for our custom packages.

### Building our image

```bash

# Upon first cloning the repo
git submodule update --init recursive

# Everytime when building run this
scripts/build.sh

# To build the sdk
scripts/build.sh sdk
```

### To add/remove packages
``` bash

# Make sure to save (dont change the suggested path when saving)
scripts/menuconfig.sh

# To save the saved changes to our config
scripts/savedefconfig.sh
```


### Copy to an SD card

```bash
cd buildroot/output/images
sudo dd if=sdcard.img of=/dev/sdX bs=4M status=progress && sync
```


