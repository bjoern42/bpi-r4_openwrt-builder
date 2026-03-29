# OpenWrt build for Banana Pi BPI-R4 with WIFI txPower hotfix
Some Banana Pi BPI-R4 BE14 WiFi modules are shipped with zeroed tx_power fields in EEPROM (2G/5G/6G). This leads to low transmit power on affected bands. This pipeline builds the latest openwrt with applied patch from danpawlik.

## Build
Steps:

1. Open the “Actions” tab in this repository.
2. Select the workflow “Build OpenWrt (BPI-R4)”.
3. Click “Run workflow” input the target and confirm. (possible options: mediatek_filogic_DEVICE_bananapi_bpi-r4 | mediatek_filogic_DEVICE_bananapi_bpi-r4-poe | mediatek_filogic_DEVICE_bananapi_bpi-r4-lite)

After the workflow finishes :

1. Open the “Releases” tab.
2. Download the latest release (tag bpi-r4-latest).

Important files in the release:

- ``openwrt-mediatek-filogic-bananapi_bpi-r4-squashfs-sysupgrade.itb`` – sysupgrade from an existing OpenWrt.
- ``openwrt-mediatek-filogic-bananapi_bpi-r4-sdcard.img.gz`` – SD card image.
- ``sha256sums`` – checksums for verification.
  
The release is always updated under the same tag  bpi-r4-latest , so the “Created” date on GitHub does not change. Check the list of files and the “Updated” time to see the latest build.

You do not need to change anything in the repository for this use case.


## credits
credits to @ https://github.com/woziwrt for the pipeline and @ https://github.com/danpawlik for the hotfix
