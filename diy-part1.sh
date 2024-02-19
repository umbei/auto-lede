# 1.修改默认IP
sed -i 's/192.168.1.1/10.0.0.101/g' package/base-files/files/bin/config_generate

# 2.Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# 3.Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings                                            

# 4.移除重复软件包
# rm -rf feeds/packages/net/mosdns
# rm -rf feeds/luci/themes/luci-theme-argon
# rm -rf feeds/luci/themes/luci-theme-netgear
# rm -rf feeds/luci/applications/luci-app-netdata
# rm -rf feeds/luci/applications/luci-app-wrtbwmon
rm -rf feeds/luci/applications/luci-app-wechatpush

# 5.添加额外软件包
# echo 'src-git kenzok8 https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git lucky https://github.com/gdy666/luci-app-lucky' >>feeds.conf.default
# git clone  https://github.com/gdy666/luci-app-lucky package/lucky
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns

# 6.科学上网
# 依赖包
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
# echo 'src-git small1 https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default

# passwall插件
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2

# helloworld插件
# echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
# svn co https://github.com/fw876/helloworld package/luci-app-ssr-plus

# 7.Themes
# git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
# git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
# svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy

# 8.调整 x86 型号只显示 CPU 型号
# sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
# sed -i 's/(dmesg.*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
# sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore

# 9.删除主题强制默认
# find package/luci-theme*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

./scripts/feeds update -a
./scripts/feeds install -a
