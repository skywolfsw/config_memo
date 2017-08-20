---
layout: memo
type: centos
key: php
---

## 安装

1. 检查当前安装的PHP包，如果有先删除
```shell
# 安装的PHP包列表
$ yum list installed | grep php
# 将上述列表中的包删除
$ sudo yum remove -y php.x86_64 php-cli.x86_64 php-common.x86_64 php-gd.x86_64 php-pdo.x86_64 php-pear.noarch php-process.x86_64 php-xml.x86_64
```

2. 安装
```shell
# 下载安装包（PHP官网http://php.net/downloads.php可以找到各版本的安装包下载链接）
wget http://cn2.php.net/distributions/php-5.5.38.tar.gz
# 解压
gunzip php-5.5.38.tar.gz
tar -xf php-5.5.38.tar
# 编译、安装
./configure
make
sudo make install
```

## 问题&解决方法

1. 执行configure时提示：
```shell
configure: error: xml2-config not found. Please check your libxml2 installation.
```
解决方法：
```shell
# 重新安装libxml2和libxml2-devel包
$ sudo yum install -y libxml2 libxml2-devel
```


