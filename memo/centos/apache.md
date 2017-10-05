---
layout: memo
type: centos
key: apache
---

## 安装

```shell
$ sudo yum install -y httpd httpd-devel
```

## 设置
- 基本设置方法<br/>
按照下述格式根据实际需要修改`/etc/httpd/conf/httpd.conf`文件中的下述配置

```shell
# 服务器监听的端口号
Listen 80
# 主站点名称（网站的主机名）
ServerName www.example.com:80
# 主站点网页存储位置
DocumentRoot "/path/to/html"
# 注释掉<Directory />中的"Require all denied"
<Directory />
    AllowOverride none
#    Require all denied
</Directory>

```
在`/etc/httpd/conf.d`文件夹中追加其他配置。
以配置php为例，追加php.conf（文件名任意，后缀为conf即可）后写入如下内容
```
#
# PHP is an HTML-embedded scripting language which attempts to make it
# easy for developers to write dynamically generated webpages.
#

LoadModule php5_module modules/libphp5.so

#
# Cause the PHP interpreter to handle files with a .php extension.
#
AddHandler php5-script .php
AddType text/html .php

#
# Add index.php to the list of files that will be served as directory
# indexes.
#
DirectoryIndex index.php

#
# Uncomment the following line to allow PHP to pretty-print .phps
# files as PHP source code:
#
#AddType application/x-httpd-php-source .phpsa

<Directory "/path/to/html">
    Options FollowSymLinks
    AllowOverride All
    Order allow,deny
    Allow from all
</Directory>
```
- 修改完配置文件后可以运行一下`apachectl configtest`检查配置的正确性
- 设置防火墙打开需要用到的端口。设置方法请参照[文件共享设置]( /memo/centos/samba )中的防火墙设置
- 修改陪之后需要重启服务`sudo service httpd restart`
