---
layout: memo
type: centos
key: rbenv
---

## 前提
- [git](/memo/centos/github)

## 安装
1. 从github上下载rbenv的代码
```shell
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```
2. 追加路径`~/.rbenv/bin`到`$PATH`环境变量
```shell
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
```
3. 加入执行rbenv的初始化的命令
```shell
$ ~/.rbenv/bin/rbenv init
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
```
4. 重启命令行使PATH的变更生效
5. 安装一些需要的插件
```shell
# 用来编译安装 ruby
$ git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# 通过 gem 命令安装完 gem 后无需手动输入 rbenv rehash 命令, 推荐
$ git clone git://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
# 国内需要安装该插件来使用Ruby China的镜像安装Ruby
$ git clone https://github.com/andorchen/rbenv-china-mirror.git ~/.rbenv/plugins/rbenv-china-mirror
```

## 参考
- [https://github.com/rbenv/rbenv](https://github.com/rbenv/rbenv)
- [https://github.com/rbenv/ruby-build](https://github.com/rbenv/ruby-build)
- [https://github.com/AndorChen/rbenv-china-mirror](https://github.com/AndorChen/rbenv-china-mirror)
