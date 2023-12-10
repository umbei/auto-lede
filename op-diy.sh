# 修改默认IP
sed -i 's/10.0.0.253/10.0.0.252/g' package/base-files/files/bin/config_generate

# Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Clear the login password
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
git pull
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig


#CONFIG_PACKAGE_luci-app-passwall=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Haproxy=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Hysteria=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Kcptun=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_PDNSD=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Libev_Client=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Libev_Server=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Client=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Server=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Simple_Obfs=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_GO=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray_Plugin=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y
#CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray_Plugin=y
