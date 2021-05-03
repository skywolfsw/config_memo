---
layout: memo
type: centos
key: composer
---

## 安装
```shell
# 注意先cd到安装文件夹
$ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$ php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
$ php composer-setup.php
$ php -r "unlink('composer-setup.php');"
```
以上即可在安装文件夹中通过执行`php composer.phar`使用。
如果需要全局性地使用`composer`命令，再执行一下下述命令即可。
```shell
$ sudo mv composer.phar /usr/local/bin/composer
```

## 参考
- [https://getcomposer.org/download/](https://getcomposer.org/download/)
