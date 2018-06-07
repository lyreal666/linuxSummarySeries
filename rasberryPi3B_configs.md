# RasberryPi3B_系统配置

### ROOT 账号设置

如果你安装的是官方的 Raspbian 系统，那么默认的登录帐号为 **pi** 密码是 **raspberry** 
为了方便折腾，建议第一时间启用 ROOT 账号吧~ 这个也很简单的，只需要执行一下两句命令即可：

```
// 设置 root 账号的密码，会让你输入两次新密码
sudo passwd root // 启用 root 账号登录
sudo passwd --unlock root
```

执行完之后，用 **reboot** 命令重启就可以用 root 登录啦。

### 更新下载源

使用管理员权限（经由sudo），编辑`/etc/apt/sources.list`文件。参考命令行为：

```shell
$ sudo nano /etc/apt/sources.list
```

用`#`注释掉原文件内容，用以下内容取代：

```shell
deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ stretch main contrib non-free rpi
deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ stretch main contrib non-free rpi
```

------

使用管理员权限（经由sudo），编辑`/etc/apt/sources.list.d/raspi.list`文件。参考命令行为：

```shell
$ sudo nano /etc/apt/sources.list.d/raspi.list
```

用`#`注释掉原文件内容，用以下内容取代：

```shell
deb http://mirror.tuna.tsinghua.edu.cn/raspberrypi/ stretch main ui
deb-src http://mirror.tuna.tsinghua.edu.cn/raspberrypi/ stretch main ui
```

------

**注意：** 网址末尾的`raspbian`重复两次是必须的。因为Raspbian的仓库中除了APT软件源还包含其他代码。APT软件源不在仓库的根目录，而在`raspbian/`子目录下。

编辑镜像站后，请使用`sudo apt-get update`命令，更新软件源列表，同时检查您的编辑是否正确。

使用`HTTPS`可以有效避免国内运营商的缓存劫持，但需要事先安装`apt-transport-https`

### 安装zip,unzip

```shell
su
apt-get install zip
```



### 安装Netease-MusicBox网易云音乐命令行播放器

[git地址](https://github.com/darknessomi/musicbox)

```shell
$ (sudo) pip install NetEase-MusicBox

$ (sudo) apt-get install mpg123
```

### 安装mplayer2

```shell
apt-get install mplayer2
wget http://blog.lxx1.com/wp-content/uploads/2016/07/shero.mp3
mplayer --no-video shero.mp3

```

### 调节音量

```
alsamixer
```

通过键盘就可以调大或者调小树莓派音量了。

![请输入图片描述](http://images.ncnynl.com/rpi/2016/rpi-audio-alsamixer.png)



