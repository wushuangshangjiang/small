#!/bin/bash
git rm -r --cache * >/dev/null 2>&1 &
function git_clone() {
git clone --depth 1 $1 $2 || true
}
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}

git clone --depth 1 -b packages https://github.com/xiaorouji/openwrt-passwall && mv -n openwrt-passwall/chinadns-ng openwrt-passwall/dns2socks openwrt-passwall/hysteria openwrt-passwall/ipt2socks openwrt-passwall/pdnsd-alt openwrt-passwall/trojan-go openwrt-passwall/trojan-plus ./ ; rm -rf openwrt-passwall
svn co https://github.com/kenzok8/jell/trunk/brook
svn co https://github.com/openwrt/packages/trunk/net/shadowsocks-libev
svn co https://github.com/fw876/helloworld/trunk/simple-obfs
svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev
svn co https://github.com/fw876/helloworld/trunk/ssocks
svn co https://github.com/fw876/helloworld/trunk/trojan
svn co https://github.com/fw876/helloworld/trunk/v2ray-core
svn co https://github.com/fw876/helloworld/trunk/v2ray-geodata
svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin
svn co https://github.com/fw876/helloworld/trunk/v2raya
svn co https://github.com/fw876/helloworld/trunk/xray-core
svn co https://github.com/fw876/helloworld/trunk/xray-plugin

bash diy/create_acl_for_luci.sh -a >/dev/null 2>&1
bash diy/convert_translation.sh -a >/dev/null 2>&1

rm -rf ./*/.git & rm -f ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore


exit 0