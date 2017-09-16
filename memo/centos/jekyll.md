---
layout: memo
type: centos
key: jekyll
---

## 前提
- [Ruby & RubyGems]({{ site.baseurl }}/memo/centos/ruby)

使用时还需要：
- [bundler]({{ site.baseurl }}/memo/centos/bundler)

## 安装

```shell
$ gem install jekyll
```

## 问题&解决方法
1. 执行`jekyll build`时，提示
```shell
'block in materialize': Could not find public_suffix-2.0.5 in any of the sources (Bundler::GemNotFound)
```
解决方法：
```shell
# 安装Gem包
$ bundle install
```

## 参考
- [Jekyll](https://jekyllrb.com/docs/installation/)
- [Jekyll中文网](http://jekyll.com.cn/docs/installation/)
