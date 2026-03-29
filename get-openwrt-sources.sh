#!/bin/bash
rm -rf openwrt

# checkout openwrt snapshot + cherry pick wifi hotfix
git config --global user.email "bjoern.eschle@disroot.org"
git config --global user.name "bjoern.eschle"


git clone https://github.com/openwrt/openwrt.git openwrt
cd openwrt;
git remote add wifiHotfix https://github.com/danpawlik/openwrt.git
git fetch wifiHotfix
git cherry-pick 4235ed7d6d0d66da384bd487e3ed899c3b315efc
cd ..
