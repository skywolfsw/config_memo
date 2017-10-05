---
layout: memo
type: aliyun
key: laravel
---

## 部署方法
- 1、由于万网不支持AES-256-CBC，所以需要改为128位加密。<br/>
修改config/app.php如下
```
'cipher' => 'AES-128-CBC',
```
- 2、配置生产环境用.env文件
    - `APP_DEBUG`设为`false`
    - `APP_KEY`需要在本地生成，生成方法见[Laravel的安装和配置方法]({{ site.baseurl }}/memo/centos/laravel)
    - 其他的根据需要设置
- 3、`composer install`安装依赖包，或者如果其他地方有现成的可以把整个vendor文件夹拷过来
- 4、由于万网虚拟主机的根目录不能修改，所以如果想要在访问的时候不用`public`就需要在工程根目录下追加.htaccess文件，内容如下

```
<IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteCond %{Request_URI} !^public
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
```

- 5、将工程下的文件和文件夹上传到万网虚拟主机的`htdocs`文件夹中<br/>
由于文件比较多，建议先压缩，把压缩包上传后，在主机上解压<br/>
详细见[主机FTP上传压缩文件及解压缩教程]( https://help.aliyun.com/knowledge_detail/36242.html )
- 6、使用ftp客户端（如，FileZilla）修改`storage`和`bootstrap/cache`文件夹的权限，使web服务有这些文件夹的写入权限<br/>
详细见[Linux虚拟主机如何修改文件目录权限]( https://help.aliyun.com/knowledge_detail/36270.html )

