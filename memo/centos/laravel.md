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

## 环境配置
- 修改`storage`和`bootstrap/cache`文件夹的权限，使web服务有这些文件夹的写入权限
- 如果没有APP_KEY，可以使用下述命令生成APP_KEY
```shell
$ php artisan key:generate
```
- 开发环境可以使用下述启动服务
```shell
$ php artisan serve --host=192.168.1.100 --port=80
```

## 参考
- [https://docs.golaravel.com/docs/5.1/installation/](https://docs.golaravel.com/docs/5.1/installation/)
