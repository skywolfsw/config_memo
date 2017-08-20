---
layout: memo
type: centos
key: ssh
---

## 安装

```shell
# 查看SSH是否安装
$ rpm -qa | grep ssh
# 若没有安装，输入以下命令安装
$ sudo yum install -y openssh-server
```

## 设置

```shell
# 启动SSH服务
$ sudo service sshd start
# 设置开机启动
$ sudo chkconfig sshd on
```
