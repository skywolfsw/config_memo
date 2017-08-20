---
layout: memo
type: centos
key: sudo
---

## 设置
1. `su`命令切换到root用户
2. `visudo`命令打开编辑/etc/sudoers配置文件
3. 找到 `root  ALL=(ALL)    ALL` ，<br/>
在该行下面追加 `username  ALL=(ALL)    ALL` *（username为需要加sudo权限的用户名）*并保存<br/>
如果sudo时不想输入密码，上述追加内容可以改为 `username  ALL=(ALL)    NOPASSWD: ALL`
