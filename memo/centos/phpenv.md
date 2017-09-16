---
layout: memo
type: centos
key: phpenv
---

## 前提
- [git]({{ site.baseurl }}/memo/centos/github)

## 安装
1. 从github上下载phpenv的代码
```shell
$ git clone git://github.com/phpenv/phpenv.git ~/.phpenv
```
2. 追加路径`~/.phpenv/bin`到`$PATH`环境变量
```shell
$ echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bash_profile
```
3. 加入执行phpenv的初始化的命令
```shell
$ echo 'eval "$(phpenv init -)"' >> ~/.bash_profile
```
4. 重启命令行使PATH的变更生效
5. 安装php-build
```shell
# 注意：先cd到可以临时存放php-build代码的文件夹中
$ git clone git://github.com/php-build/php-build
$ cd php-build
$ sudo ./install.sh
```

## 参考
- [https://github.com/phpenv/phpenv](https://github.com/phpenv/phpenv)
- [http://www.cnblogs.com/jcuan/p/6209041.html](http://www.cnblogs.com/jcuan/p/6209041.html)
- [https://github.com/php-build/php-build](https://github.com/php-build/php-build)
