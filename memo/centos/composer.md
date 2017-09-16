---
layout: memo
type: centos
key: composer
---

## 安装
```shell
# 注意先cd到安装文件夹
$ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$ php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
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
