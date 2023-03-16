#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-op.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/10.0.0.251/10.0.0.101/g' package/base-files/files/bin/config_generate

# 添加额外软件包
echo 'src-git OpenClash https://github.com/vernesong/OpenClash' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' >>feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
# echo 'src-git kenzok8 https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
# git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
# git clone --depth 1 https://github.com/iwrt/luci-app-ikoolproxy package/luci-app-ikoolproxy
# git clone --depth 1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
svn co https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-adguardhome package/luci-app-adguardhome

#添加smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
