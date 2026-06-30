#!/bin/bash
set -e
echo "===== Modify .config for OpenClash ====="
# 启用 OpenClash
sed -i 's/# CONFIG_PACKAGE_luci-app-openclash is not set/CONFIG_PACKAGE_luci-app-openclash=y/' .config

# OpenClash必须dnsmasq-full，替换原版dnsmasq
sed -i 's/CONFIG_PACKAGE_dnsmasq=y/# CONFIG_PACKAGE_dnsmasq=y/' .config
sed -i 's/# CONFIG_PACKAGE_dnsmasq-full is not set/CONFIG_PACKAGE_dnsmasq-full=y/' .config

# 依赖工具
sed -i 's/# CONFIG_PACKAGE_coreutils-nohup is not set/CONFIG_PACKAGE_coreutils-nohup=y/' .config
sed -i 's/# CONFIG_PACKAGE_bash is not set/CONFIG_PACKAGE_bash=y/' .config
sed -i 's/# CONFIG_PACKAGE_ipset is not set/CONFIG_PACKAGE_ipset=y/' .config

# 中文LuCI（可选）
sed -i 's/# CONFIG_LUCI_LANG_zh_Hans is not set/CONFIG_LUCI_LANG_zh_Hans=y/' .config

# 如果你不需要Passwall，取消下面注释屏蔽
 sed -i 's/CONFIG_PACKAGE_luci-app-passwall=y/# CONFIG_PACKAGE_luci-app-passwall=y/' .config
