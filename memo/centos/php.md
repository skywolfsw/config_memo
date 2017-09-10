---
layout: memo
type: centos
key: php
---

## 安装

- [方法一 用rbenv安装](#rbenv)
- [方法二 编译安装](#build)

<div id="rbenv"></div>
### 方法一 用rbenv安装

#### 前提
- [phpenv & php-build](/memo/centos/phpenv)

#### 安装
```shell
# 查看可安装列表
$ php-build --definitions
# 安装指定版本，例：5.5.9
$ php-build 5.5.9 ~/.phpenv/versions/5.5.9
```

<div id="build"></div>
### 方法二 编译安装

#### 安装
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

1. 安装时提示：
```shell
configure: error: xml2-config not found. Please check your libxml2 installation.
```
解决方法：
```shell
# 重新安装libxml2和libxml2-devel包
$ sudo yum install -y libxml2 libxml2-devel
```
2. 提示：
```shell
configure: error: Please reinstall the BZip2 distribution
```
解决方法：
```shell
# 安装bzip2和bzip2-devel包
$ sudo yum -y install bzip2 bzip2-devel
```
3. 提示：
```shell
configure: error: Please reinstall the libcurl distribution -
    easy.h should be in <curl-dir>/include/curl/
```
解决方法：
```shell
# 安装libcurl和libcurl-devel包
$ sudo yum -y install libcurl libcurl-devel
```
4. 提示：
```shell
configure: error: jpeglib.h not found.
```
解决方法：
```shell
# 安装libcurl和libcurl-devel包
$ sudo yum -y install libcurl libcurl-devel
```
5. 提示：
```shell
configure: error: png.h not found.
```
解决方法：
```shell
# 安装libpng和libpng-devel包
$ sudo yum -y install libpng libpng-devel
```
6. 提示：
```shell
configure: error: Unable to detect ICU prefix or no failed. Please verify ICU install prefix and make sure icu-config works.
```
解决方法：
```shell
# 安装libicu-devel包
$ sudo yum -y install libicu-devel
```
7. 提示：
```shell
configure: error: mcrypt.h not found. Please reinstall libmcrypt.
```
解决方法：
```shell
$ wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/libmcrypt/libmcrypt-2.5.7.tar.gz
$ tar zxf libmcrypt-2.5.7.tar.gz
$ cd libmcrypt-2.5.7
$ ./configure
$ sudo make && sudo make install
```
8. 提示：
```shell
configure: error: Cannot find libtidy
```
解决方法：
```shell
# ???
```
9. （待追加。。。）
