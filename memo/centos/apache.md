---
layout: memo
type: centos
key: apache
---

## 安装

```shell
$ sudo yum install -y httpd
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
DocumentRoot "/var/www/html"
# 对主站点的目录进行访问控制
<Directory "/var/www/html"> 
    Options FollowSymLinks 
    AllowOverride Allow     #如果使用.htaccess这里必须设为[Allow]，否则设为[None]
    Order allow,deny 
    Allow from all 
</Directory> 
```

- 设置防火墙打开需要用到的端口。设置方法请参照[文件共享设置]( /memo/centos/samba )中的防火墙设置
