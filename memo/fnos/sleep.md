---
layout: memo
type: fnos
key: sleep
---

## 合盖不休眠

`/etc/systemd/logind.conf` 如下修改后，重启

```
HandleLidSwitch=ignore
```
