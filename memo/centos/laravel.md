---
layout: memo
type: centos
key: laravel
---

## 前提
- [PHP]({{ site.baseurl }}/memo/centos/php)
- [Composer]({{ site.baseurl }}/memo/centos/composer)

## 安装

#### 通过Laravel Install安装
```shell
# 使用Composer下载Laravel install
$ composer global require "laravel/installer"
# 追加路径`~/.composer/vendor/bin`到`$PATH`环境变量
$ echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bash_profile
# 重启命令行使PATH的变更生效，即可使用laravel命令
# 使用laravel new命令生成工程，例：blog
$ laravel new blog
```

#### 通过Composer Create-Project安装（指定版本的话需要使用该方法）
```shell
# 例：指定Laravel v5.1生成blog工程
$ composer create-project laravel/laravel blog "5.1.*"
```

## 参考
- [https://docs.golaravel.com/docs/5.1/installation/](https://docs.golaravel.com/docs/5.1/installation/)
