#!/bin/bash

# Rewrite $PROXY
PROXY=http://host.proxy.jp:port/

# proxy settings **********************************************

echo "setting /etc/profile.d/proxy.(sh|csh)"
echo "\
export http_proxy=$PROXY
export ftp_proxy=$PROXY
export HTTP_PROXY=$PROXY
export FTP_PROXY=$PROXY" > \
"/etc/profile.d/proxy.sh"

echo "\
setenv http_proxy=$PROXY
setenv ftp_proxy=$PROXY
setenv HTTP_PROXY=$PROXY
setenv FTP_PROXY =$PROXY" > \
"/etc/profile.d/proxy.csh"

echo "setting /etc/yum.conf"
echo "\
proxy=$PROXY" >> "/etc/yum.conf"

echo "setting /etc/wgetrc"
echo "\
http_proxy = $PROXY
ftp_proxy = $PROXY
use_proxy = on " >> "/etc/wgetrc"


echo "successed proxy settings"
