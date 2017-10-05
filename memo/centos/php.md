---
layout: memo
type: centos
key: php
---

## 前提
- 建议先将【[问题&解决方法](#solutions)】中的包先安装之后再开始php的安装

## 安装

- [方法一 用phpenv安装](#phpenv)
- [方法二 编译安装](#build)

<div id="phpenv"></div>
### 方法一 用phpenv安装

#### 前提
- [phpenv & php-build]({{ site.baseurl }}/memo/centos/phpenv)
- 如果准备用Apache搭建服务器环境的话还需要先安装[Apache]({{ site.baseurl }}/memo/centos/apache)

#### 安装
- 不使用Apache时的安装方法
```shell
# 查看可安装列表
$ php-build --definitions
# 安装指定版本，例：5.5.9
$ php-build 5.5.9 ~/.phpenv/versions/5.5.9
```
- 使用Apache时的安装方法
```shell
# 查看可安装列表
$ php-build --definitions
# 查看apxs所在的路径
$ rpm -ql httpd-devel | grep apxs
# 修改准备安装的版本的编译配置
$ sudo vi /usr/local/share/php-build/definitions/5.5.9
# configure_option修改为如下，其中[/usr/bin/apxs]为前面查到的apxs所在的路径
configure_option "--with-apxs2=/usr/bin/apxs --with-mysql=mysqlnd"
# 安装前先确认一下httpd的modules文件夹的权限，需要有写入权限，否则libphp5.so文件会写入失败
# 安装指定版本，例：5.5.9
$ php-build 5.5.9 ~/.phpenv/versions/5.5.9
# 备份libphp5.so文件，因为安装其他版本时该文件会被覆盖。切换版本时记得将相应版本的libphp5.so文件拷回/etc/httpd/modules/
$ cp /etc/httpd/modules/libphp5.so ~/.phpenv/versions/5.5.9/
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

<div id="solutions"></div>
## 问题&解决方法

1. 提示
```shell
configure: error: xml2-config not found. Please check your libxml2 installation.
```
解决方法：
```shell
# 安装libxml2和libxml2-devel包
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
# 安装libjpeg-devel包
$ sudo yum -y install libjpeg-devel
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
# 安装libtidy和libtidy-devel包
$ sudo yum -y install libtidy libtidy-devel
```
如果上述方法报错，可以尝试下述方法：
```shell
# 下载libtidy和libtidy-devel的rpm文件
$ wget ftp://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/l/libtidy-5.4.0-3.fc27.x86_64.rpm
$ wget ftp://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/l/libtidy-devel-5.4.0-3.fc27.x86_64.rpm
# 安装libtidy和libtidy-devel
$ sudo rpm -ivh libtidy-5.4.0-3.fc27.x86_64.rpm
$ sudo rpm -ivh libtidy-devel-5.4.0-3.fc27.x86_64.rpm
```
注：这里的rpm文件是64位系统用的，如果需要32位系统或者其他版本可以到[rpmfind]( http://rpmfind.net/ )网站上找到相应的下载地址。
9. 提示：
```shell
configure: error: xslt-config not found. Please reinstall the libxslt >= 1.1.0 distribution
```
解决方法：
```shell
# 安装libxslt-devel包
$ sudo yum -y install libxslt-devel
```
10. 提示：
```shell
configure: error: Don't know how to define struct flock on this system, set --enable-opcache=no
```
解决方法：
```shell
# 编辑库文件
$ sudo vi /etc/ld.so.conf.d/local.conf
# 64位系统添加该行，如果是32位系统需要将下属lib64改为lib。之后保存退出
/usr/local/lib64
# 使之生效
$ sudo ldconfig -v
```
11. 提示：
```shell
Cannot find autoconf. Please check your autoconf installation and the
$PHP_AUTOCONF environment variable. Then, rerun this script.
```
解决方法：
```shell
# 编辑库文件
$ sudo yum install -y autoconf
```

## 参考
- [virtualbox(centos)でphpenv+php-buildインストールメモ(5.3,5.4変更確認まで) - Qiita]( https://qiita.com/ryurock/items/7d031440bb174a55a6a1 )
