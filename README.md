# DashBuildroot
Buildroot repo that contains the build system for our custom packages.

### Build Base Beagleplay

```cd buildroot ```\
```make beagleplay_defconfig ```\
```make ```

### Copy to an SD card

```cd buildroot/output/images ```\
```sudo dd if=sdcard.img of=/dev/sdX BS=4M status=progress && sync```