#!/bin/bash

# Add luci-app-adguardhome
rm -rf package/luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
echo "
CONFIG_PACKAGE_luci-app-adguardhome=y
" >> .config

# ----- uninstall -----
# uhttpd
echo "
CONFIG_PACKAGE_uhttpd=n
CONFIG_PACKAGE_uhttpd-mod-ubus=n
" >> .config

# filetransfer (depend on uhttpd)
echo "
CONFIG_DEFAULT_luci-app-filetransfer=n
CONFIG_MODULE_DEFAULT_luci-app-filetransfer=n
CONFIG_PACKAGE_luci-app-filetransfer=n
CONFIG_PACKAGE_luci-i18n-filetransfer-zh-cn=n
" >> .config

# samba4
echo "
CONFIG_MODULE_DEFAULT_luci-app-samba4=n
CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_PACKAGE_luci-i18n-samba4-zh-cn=n
CONFIG_PACKAGE_samba4-libs=n
CONFIG_PACKAGE_samba4-server=n
CONFIG_SAMBA4_SERVER_WSDD2=n
CONFIG_SAMBA4_SERVER_NETBIOS=n
CONFIG_SAMBA4_SERVER_AVAHI=n
CONFIG_SAMBA4_SERVER_VFS=n
" >> .config

# Shadowsocks
echo "
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_NONE_Client=n
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_NONE_Server=n
" >> .config

# V2RAY
echo "
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NONE_V2RAY=n
" >> .config

# usb-printer
echo "
CONFIG_MODULE_DEFAULT_luci-app-usb-printer=n
CONFIG_MODULE_DEFAULT_luci-i18n-usb-printer-zh-cn=n
CONFIG_PACKAGE_kmod-usb-printer=n
CONFIG_PACKAGE_luci-app-usb-printer=n
CONFIG_PACKAGE_luci-i18n-usb-printer-zh-cn=n
" >> .config



# ----- install -----
# bash curl dos2unix unix2dos lrzsz
echo "
CONFIG_PACKAGE_bash=y

CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_libcurl=y

CONFIG_BUSYBOX_DEFAULT_DOS2UNIX=y
CONFIG_PACKAGE_dos2unix=y

CONFIG_BUSYBOX_DEFAULT_UNIX2DOS=y
CONFIG_PACKAGE_unix2dos=y

CONFIG_PACKAGE_lrzsz=y
" >> .config

# nginx Luci
echo "
# nginx-ssl includes nginx
CONFIG_PACKAGE_luci-ssl-nginx=y
CONFIG_PACKAGE_nginx=n
CONFIG_PACKAGE_nginx-ssl=y

CONFIG_PACKAGE_nginx-all-module=n
CONFIG_PACKAGE_nginx-mod-luci=y
CONFIG_PACKAGE_nginx-mod-luci-ssl=y

CONFIG_PACKAGE_nginx-util=y
CONFIG_PACKAGE_nginx-ssl-util=y
CONFIG_PACKAGE_nginx-ssl-util-nopcre=n
" >> .config

# udpxy
echo "
CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_udpxy=y
" >> .config

# vlmcsd
echo "
CONFIG_PACKAGE_luci-app-vlmcsd=y
CONFIG_PACKAGE_vlmcsd=y
" >> .config