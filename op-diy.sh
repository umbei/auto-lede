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

rm -rf luci-app-wechatpush


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

# 克隆 kenzok8-packages 仓库
git clone --depth=1 https://github.com/kenzok8/openwrt-packages.git kenzok8-packages
cp -rf kenzok8-packages/smartdns package/smartdns
cp -rf kenzok8-packages/luci-app-passwall package/luci-app-passwall
cp -rf kenzok8-packages/luci-app-eqos package/luci-app-eqos
cp -rf kenzok8-packages/mosdns package/mosdns
cp -rf kenzok8-packages/luci-app-mosdns package/luci-app-mosdns
cp -rf kenzok8-packages/luci-theme-edge package/luci-theme-edge
cp -rf kenzok8-packages/luci-lib-taskd package/luci-lib-taskd
cp -rf kenzok8-packages/taskd package/taskd
cp -rf kenzok8-packages/luci-lib-xterm package/luci-lib-xterm
cp -rf kenzok8-packages/alist package/alist
cp -rf kenzok8-packages/luci-app-alist package/luci-app-alist
cp -rf kenzok8-packages/luci-app-advanced package/luci-app-advanced
cp -rf kenzok8-packages/ddnsto package/ddnsto
cp -rf kenzok8-packages/luci-app-ddnsto package/luci-app-ddnsto
cp -rf kenzok8-packages/luci-app-ikoolproxy package/luci-app-ikoolproxy
#rm -rf kenzok8-packages

git clone --depth=1 https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

# themes
git clone --depth=1 https://github.com/Leo-Jo-My/luci-theme-Butterfly package/luci-theme-Butterfly
git clone --depth=1 https://github.com/Leo-Jo-My/luci-theme-Butterfly-dark package/luci-theme-Butterfly-dark
git clone --depth=1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
git clone --depth=1 https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
git clone --depth=1 https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial
git clone --depth=1 https://github.com/sirpdboy/luci-theme-opentopd package/luci-theme-opentopd

#添加istore
git clone --depth=1 https://github.com/linkease/istore-ui.git
cp -rf istore-ui/app-store-ui package/app-store-ui
git clone --depth=1 https://github.com/linkease/istore.git
cp -rf istore/luci/luci-app-store package/luci-app-store
sed -i 's/luci-lib-ipkg/luci-base/g' package/luci-app-store/Makefile
#rm -rf istore-ui istore


