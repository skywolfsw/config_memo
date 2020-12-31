---
layout: memo
type: aws
key: shadowsocks
---

## EC2 Template

### ShadowSocks only
- For Amazon Linux 2

```shell
#!/bin/bash
yum -y install git
yum -y install python-setuptools && easy_install pip
pip install git+https://github.com/shadowsocks/shadowsocks.git@master
(
cat <<JSON
{
    "server":"0.0.0.0",
    "server_port":8388,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"<password>",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}
JSON
) >/etc/shadowsocks.json
echo /usr/bin/ssserver -c /etc/shadowsocks.json -d start >>/etc/rc.local
/usr/bin/ssserver -c /etc/shadowsocks.json -d start
```

### ShadowSocks with Brdgrd
- For Amazon Linux 2

```shell
#!/bin/bash
yum -y install git
yum -y install python-setuptools && easy_install pip
pip install git+https://github.com/shadowsocks/shadowsocks.git@master
(
cat <<JSON
{
    "server":"0.0.0.0",
    "server_port":8388,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"<password>",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}
JSON
) >/etc/shadowsocks.json
echo /usr/bin/ssserver -c /etc/shadowsocks.json -d start >>/etc/rc.local
/usr/bin/ssserver -c /etc/shadowsocks.json -d start

# setup brdgrd
yum -y install gcc libnetfilter_queue-devel
mkdir /software
cd /software
git clone https://github.com/NullHypothesis/brdgrd.git
cd brdgrd
make
echo "/software/brdgrd/brdgrd &" >>/etc/rc.local
iptables -A OUTPUT -p tcp --tcp-flags SYN,ACK SYN,ACK --sport 8388 -j NFQUEUE --queue-num 0
service iptables save
/software/brdgrd/brdgrd &
```
