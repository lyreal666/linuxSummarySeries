# 树莓派相关问题记录

## 开启root用户

1. sudo passwd root # 设置密码

2. sudo passwd --unlock root # 解锁root账户

   参考:[树莓派（raspberry）启用root账户](http://outofmemory.cn/code-snippet/2897/shumeipai)

## 设置wifi自动连接

参考2篇文章:

1. [树莓派连接WiFi（最稳定的方法)](https://blog.csdn.net/hktkfly6/article/details/73302648)
2. [树莓派Raspberry命令行配置无线网络连接](https://www.cnblogs.com/shubin/p/7746399.html)

### 准备工作

1. 开启root用户
2. ssh连接树莓派,参考我另一个文章:[RaspberryPi3B](https://github.com/lyreal666/linuxSummarySeries/blob/master/raspberryPi3B.md)
3. vim的简单使用

### 1.修改/etc/network/interfaces文件如下

1. 先登入root账户：输入su,输入两遍密码,命令提示符变成`root@raspberrypi:/home/pi#`  表示已经是root用户；
2. 然后`vi  /etc/network/interfaces` 修改成下面这个样子

```shell
# interfaces(5) file used by ifup(8) and ifdown(8)

# Please note that this file is written to be used with dhcpcd
# For static IP, consult /etc/dhcpcd.conf and 'man dhcpcd.conf'

# Include files from /etc/network/interfaces.d:
source-directory /etc/network/interfaces.d

auto lo 
iface lo inet loopback 

auto eth0 
iface eth0 inet dhcp 

allow-hotplug wlan0 

iface wlan0 inet dhcp
wpa_conf /etc/wpa_supplicant/wpa_supplicant.conf

```

### 2.修改/etc/wpa_supplicant/wpa_supplicant.conf 如下

使用 vi /etc/wpa_supplicant/wpa_supplicant.conf 命令修改成下面这个样子

说明:

1. 没有密码的wifi必须有key_mgmt=NONE
2. ssid是wifi名,psk是wifi密码
3. priority是wifi优先级,数字越大优先使用哪个,不能设置为负数

```shell
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
# 最常用的配置。WPA-PSK 加密方式。
# 第一个我手机热点,第二个我宿舍路由器
network={
        ssid="lyreal666"
        key_mgmt=NONE
        priority=3
}

network={
ssid="TP-LINK_0A4A"
psk="527527527"
priority=2
}

```

### 3.重启树莓派

1. 关掉树莓派电源
2. 拔掉树莓派正在使用的网线
3. 重新插电源

### 4.登入wifi管理员界面查看

1. 连接路由器wifi
2. 浏览器打开192.168.1.1,查看设备信息
3. 打开raspberry管理
4. 查看raspberry在路由器下的子网ip
5. 电脑连上同一个wifi,使用shh连接工具输入ip连接

![路由器连接成功图:](https://github.com/lyreal666/linuxSummarySeries/blob/master/screenshot/rasp/wifiAdmin.png?raw=true)

![手机热点连接成功图:](https://github.com/lyreal666/linuxSummarySeries/blob/master/screenshot/rasp/phoneWifi.png?raw=true)