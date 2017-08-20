---
layout: memo
type: centos
key: samba
---

## 安装

```shell
# 安装samba
$ sudo yum -y install samba samba-client samba-common
# <Opt>查看Samba版本信息
$ rpm -qi samba
```
## 设置

#### 1. 启动samba服务
```shell
# 启动samba服务
$ sudo service smb start
# 启动samba别名服务
$ sudo service nmb start
# 设置开机启动
$ sudo chkconfig smb on
$ sudo chkconfig nmb on
```
#### 2. 防火墙
设置防火墙开启一下端口
UDP 137
UDP 138
TCP 139
TCP 445
- CentOS 6.5
```shell
# 打开防火墙配置文件
$ sudo vi /etc/sysconfig/iptables
# 在文件中追加如下内容并保存
-A INPUT -m state --state NEW -m tcp -p tcp --dport 139 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 445 -j ACCEPT
-A INPUT -m state --state NEW -m udp -p udp --dport 137 -j ACCEPT
-A INPUT -m state --state NEW -m udp -p udp --dport 138 -j ACCEPT
# 重启防火墙是规则生效
$ sudo service iptables restart
```
- CentOS 7
```shell
# 开启需要的端口
$ sudo firewall-cmd --zone=public --add-port=139/tcp --permanent
$ sudo firewall-cmd --zone=public --add-port=445/tcp --permanent
$ sudo firewall-cmd --zone=public --add-port=137/udp --permanent
$ sudo firewall-cmd --zone=public --add-port=138/udp --permanent
# 重启防火墙是规则生效
$ sudo service iptables restart
```

#### 3. 关闭SELinux
```shell
# 临时关闭SELinux
$ sudo setenforce 0
# 修改SELinux设置（重启系统后才会生效，如果已临时关闭SELinux，则不用重启）
$ sudo vi /etc/selinux/config
# 修改 SELINUX=enforcing 为
SELINUX=disabled
```
#### 4. 添加samba用户
```shell
# 将已有的linux用户追加到Samba用户，并设置密码（这里的密码是Samba的密码，不是登录linux系统的密码）
$ sudo smbpasswd -a username
```
用户的home目录的共享默认是打开的，所以此时通过追加的用户名密码登录共享即可访问用户的home目录。
