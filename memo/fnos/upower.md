---
layout: memo
type: fnos
key: upower
---

## 电池做UPS

### 安装upower

```
$ sudo apt install upower
$ sudo systemctl enable upower
```

### 电源设置

`/etc/UPower/UPower.conf` 如下修改，修改电池阈值和电池不足时执行的动作

```
PercentageLow=40
PercentageCritial=30
PercentageAction=20

CriticalPowerAction=PowerOff
```

重启upower服务

```
$ sudo systemctl restart upower
```

### 电池关联命令

```
# 查看电池状态
$ upower -i `upower -e | grep 'BAT'`
```
