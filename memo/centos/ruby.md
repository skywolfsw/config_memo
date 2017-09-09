---
layout: memo
type: centos
key: ruby
---

## 前提
- [rbenv](/memo/centos/rbenv)
- [GCC编译环境](/memo/centos/gcc)
- [OpenSSL](/memo/centos/openssl)

## 安装
```shell
# 查看可安装列表
$ rbenv install -l
# 安装指定版本，例：2.3.0
$ rbenv install 2.3.0
```
- 关于RubyGems：<br/>
从Ruby 1.9版起RubyGems成为了Ruby标准库的一部分，所以安装了1.9以上版本的ruby不需要另外安装RubyGems

## 问题&解决方法
1. 提示:
```shell
warning: bzip2 not found; consider installing `bzip2` package
```
解决方法:
```shell
# 安装bzip2
$ sudo yum -y install bzip2
```

## 参考
- [https://github.com/rbenv/rbenv](https://github.com/rbenv/rbenv)
- [https://github.com/rbenv/ruby-build](https://github.com/rbenv/ruby-build)
