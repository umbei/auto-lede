# 修改默认IP
sed -i 's/192.168.1.1/10.0.0.101/g' package/base-files/files/bin/config_generate

# Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings                                            

# 移除重复软件包
# rm -rf feeds/packages/net/mosdns
# rm -rf feeds/luci/themes/luci-theme-argon
# rm -rf feeds/luci/themes/luci-theme-netgear
# rm -rf feeds/luci/applications/luci-app-netdata
# rm -rf feeds/luci/applications/luci-app-wrtbwmon
rm -rf feeds/luci/applications/luci-app-wechatpush

# 添加额外软件包
echo 'src-git passwall https://github.com/umbei/passwall' >>feeds.conf.default
echo 'src-git passwallpackages https://github.com/umbei/openwrt-passwall-packages' >>feeds.conf.default
echo 'src-git small https://github.com/umbei/ssr-passwall-vssr-bypass' >>feeds.conf.default
# echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
# echo 'src-git kenzok8 https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
# git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
# git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
  git clone  https://github.com/gdy666/luci-app-lucky package/lucky
# svn co https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-adguardhome package/luci-app-adguardhome

# 添加smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns

# 科学上网插件
# git clone --depth 1 https://github.com/jerrykuku/luci-app-vssr package/luci-app-vssr
# git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
# svn co https://github.com/kiddin9/openwrt-bypass/trunk/luci-app-bypass package/luci-app-bypass
# svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
# svn co https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-passwall package/luci-app-passwall
# svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
# svn co https://github.com/fw876/helloworld package/luci-app-ssr-plus

# Themes
# git clone --depth 1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
# git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
# git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
# git clone --depth 1 https://github.com/thinktip/luci-theme-neobird package/luci-theme-neobird
# git clone --depth 1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy


# MosDNS
# svn co https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/luci-app-mosdns
# svn co https://github.com/sbwml/luci-app-mosdns/trunk/mosdns package/mosdns


# 设置向导
# svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard package/luci-app-wizard
# sed -i 's/"admin"/"admin", "system"/g' package/luci-app-wizard/luasrc/controller/wizard.lua

# 在线用户
# svn co https://github.com/haiibo/packages/trunk/luci-app-onliner package/luci-app-onliner
# sed -i '/bin\/sh/a\uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
# sed -i '/nlbwmon/a\uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings

# 修改版本为编译日期
# date_version=$(date +"%Y.%m.%d")
# orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
# sed -i "s/${orig_version}/R${date_version} by umbei/g" package/lean/default-settings/files/zzz-default-settings

# 调整 x86 型号只显示 CPU 型号
# sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
# sed -i 's/(dmesg.*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
# sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore

# 修改 Makefile
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

# 删除主题强制默认
find package/luci-theme*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

./scripts/feeds update -a
./scripts/feeds install -a
