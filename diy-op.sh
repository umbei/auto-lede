## 修改默认IP
# sed -i 's/10.0.0.251/10.0.0.101/g' package/base-files/files/bin/config_generate

# Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Clear the login password
# sed -i "$2y$10$Czru1JJHmsJlSTjbWROSX.GvSqHXELlmiPqsCb15//ALXYeJ4VN76" package/lean/default-settings/files/zzz-default-settings


# 添加额外软件包
# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
# echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' >>feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy
svn co https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/kenzok8/openwrt-packages/tree/master/adguardhome package/adguardhome
svn co https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-aliddns package/luci-app-aliddns
svn co https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-passwall package/luci-app-passwall
svn co https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-passwall2 package/luci-app-passwall2
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns

# 修改版本为编译日期
# date_version=$(date +"%Y.%m.%d")
# orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
# sed -i "s/${orig_version}/R${date_version} by umbei/g" package/lean/default-settings/files/zzz-default-settings

# 调整 x86 型号只显示 CPU 型号
# sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
# sed -i 's/(dmesg.*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
# sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore

./scripts/feeds update -a
./scripts/feeds install -a
