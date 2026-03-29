# OpenWrt build for Banana Pi BPI-R4 with WIFI txPower hotfix
Some Banana Pi BPI-R4 BE14 WiFi modules are shipped with zeroed tx_power fields in EEPROM (2G/5G/6G). This leads to low transmit power on affected bands. This pipeline builds the latest openwrt with applied patch from danpawlik.

## Build
Steps:

1. Open the “Actions” tab in this repository.
2. Select the workflow “Build OpenWrt (BPI-R4)”.
3. Click “Run workflow” input the target and confirm. (possible options: mediatek_filogic_DEVICE_bananapi_bpi-r4 | mediatek_filogic_DEVICE_bananapi_bpi-r4-poe | mediatek_filogic_DEVICE_bananapi_bpi-r4-lite)

  
The release is always updated under the same tag  bpi-r4-latest , so the “Created” date on GitHub does not change. Check the list of files and the “Updated” time to see the latest build.

## credits
credits to @ https://github.com/woziwrt for the pipeline and @ https://github.com/danpawlik for the hotfix
