This file allows udev on linux to see an android device with proper ids.
51-android.rules should be placed in /etc/udev/rules.d
Get device vendor/id by:
$ lsusb
find vendor/id's at 0000:0000 and place those vales at:
ATTR{idVendor} and ATTR{idProduct}
