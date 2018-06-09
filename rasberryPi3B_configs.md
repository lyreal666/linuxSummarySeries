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



### 更新python3.5到3.6

转载自[树莓派编译安装python3.6](https://www.jianshu.com/p/df1086337ee4)

一、更新树莓派系统

```
$ sudo  apt-get  update
$ sudo  apt-get  upgrade
```

二、安装python依赖环境

```
$ sudo apt-get install build-essential libsqlite3-dev sqlite3 bzip2 libbz2-dev
```

三、下载python3.6版本源码并解压

```
$ wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz
$ tar zxvf Python-3.6.1.tgz
```

四、编译安装

```
$ cd Python-3.6.1
$ sudo ./configure
$ sudo make
$ sudo make install
```

五、检查安装

```
$ ls -al /usr/local/bin/python*
lrwxrwxrwx 1 root staff       9 May 15 14:53 /usr/local/bin/python3 -> python3.6
-rwxr-xr-x 2 root staff 9840168 May 15 14:51 /usr/local/bin/python3.6
lrwxrwxrwx 1 root staff      17 May 15 14:53 /usr/local/bin/python3.6-config -> python3.6m-config
-rwxr-xr-x 2 root staff 9840168 May 15 14:51 /usr/local/bin/python3.6m
-rwxr-xr-x 1 root staff    3103 May 15 14:53 /usr/local/bin/python3.6m-config
lrwxrwxrwx 1 root staff      16 May 15 14:53 /usr/local/bin/python3-config -> python3.6-config
```

小知识点

```
1. usr 是指 Unix System Resource，而不是User；
2. /usr/bin：系统预装的可执行程序，会随着系统升级而改变；
3. /usr/local/bin：用户放置自己的可执行程序的地方，推荐放在这里，不会被系统升级而覆盖同名文件；
如果两个目录下有相同的可执行程序，谁优先执行受到PATH环境变量的影响，比如我的一台服务器的PATH变量为：
$ echo $PATH 
/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/dean/bin 
这里/usr/local/bin优先于/usr/bin.
```



 