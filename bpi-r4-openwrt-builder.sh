#!/bin/bash
set -euo pipefail

cd openwrt;

#download external toolchain
curl -s -L https://downloads.openwrt.org/snapshots/targets/mediatek/filogic/openwrt-toolchain-mediatek-filogic_gcc-14.3.0_musl.Linux-x86_64.tar.zst | tar --zstd -xvf - -C .

# config
./scripts/feeds update -a && ./scripts/feeds install -a

curl -o .config https://downloads.openwrt.org/snapshots/targets/mediatek/filogic/config.buildinfo

./scripts/ext-toolchain.sh \
        --toolchain openwrt-toolchain-mediatek-filogic_gcc-14.3.0_musl.Linux-x86_64/toolchain-aarch64_cortex-a53_gcc-14.3.0_musl/ \
        --overwrite-config \
        --config mediatek_filogic_DEVICE_bananapi_bpi-r4-poe

#build
make -j $(nproc) defconfig download clean world
