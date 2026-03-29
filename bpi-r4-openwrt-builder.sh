#!/bin/bash
set -euo pipefail

rm -rf openwrt

# checkout openwrt snapshot + cherry pick wifi hotfix
git config user.email "bjoern.eschle@disroot.org"
git config user.name "bjoern.eschle"


git clone https://github.com/openwrt/openwrt.git openwrt
cd openwrt;
git remote add wifiHotfix https://github.com/danpawlik/openwrt.git
git fetch wifiHotfix
git cherry-pick 4235ed7d6d0d66da384bd487e3ed899c3b315efc

#download external toolchain
curl -s -L https://downloads.openwrt.org/snapshots/targets/mediatek/filogic/openwrt-toolchain-mediatek-filogic_gcc-14.3.0_musl.Linux-x86_64.tar.zst | tar --zstd -xvf - -C .

./scripts/feeds update -a && ./scripts/feeds install -a

wget https://downloads.openwrt.org/snapshots/targets/mediatek/filogic/config.buildinfo -O .config
./scripts/ext-toolchain.sh \
        --toolchain openwrt-toolchain-mediatek-filogic_gcc-14.3.0_musl.Linux-x86_64/toolchain-aarch64_cortex-a53_gcc-14.3.0_musl/ \
        --overwrite-config \
        --config mediatek_filogic_DEVICE_bananapi_bpi-r4-poe

#build
make -j $(nproc) defconfig download clean world
