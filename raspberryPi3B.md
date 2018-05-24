# RaspberryPi3B

>树莓派3代B型安装系统以及使用ssh连接

![raspberryPi3B](http://www.ruanyifeng.com/blogimg/asset/2017/bg2017061502.jpg)

安装系统有两种方法:

1. 使用官方安装器 [NOOBS](https://www.raspberrypi.org/documentation/installation/noobs.md) ,按部就班就行,参考[阮一峰的博客](https://blog.csdn.net/panbiao1999/article/details/77035097)
2. 在sd卡上烧录系统

**我使用的是sd安装系统**

## 准备工作

硬件:

1. 树莓派三代b型1个
2. sd卡,建议大于8G
3. 网线一根
4. 电脑一台
5. 路由器一台(可以不用)
6. 显示器(可以不用)

软件:

1. [sdFormatter](https://www.sdcard.org/downloads/formatter_4/eula_windows/index.html)
2. [win32 disk imager](https://sourceforge.net/projects/win32diskimager/)
3. xshell或者其它ssh连接工具
4. [raspbian系统镜像](https://www.raspberrypi.org/downloads/) 建议使用torrent下载,不易丢失文件

## 安装系统步骤

### 格式化sd卡

使用sdFormatter格式化sd卡

![操作图片](https://github.com/lyreal666/linuxSummarySeries/blob/master/sdFormatter.png?raw=true)

###烧系统

使用win32 disk imager往格式化后的sd写入系统镜像

![操作图片]()

## 使用ssh

参考:[博客链接](https://blog.csdn.net/w1063042587/article/details/79327336  )

### 开启shh功能

出于安全考虑，树莓派的ssh功能默认是关闭的。我们需要在烧录好的存储卡（“boot”盘）根目录当中创建一个名为“ssh”（无后缀名）的空文件，这样树莓派上电启动后就会自动开启ssh功能供我们远程连接。 

### 获取树莓派ip

两种方法

方法一: 通过显示器直接开启ssh功能

方法二: 如果有网线和连接了电脑的路由器,如果树莓派和电脑都连接在自己的路由器上，我们就可以登录路由器的管理页面，查看主机列表当中名为raspberri的设备的IP地址并记录下来。

方法三: 在电脑中按下Win+R键打开运行窗口，输入cmd并单击确定进入命令提示符，然后在黑框当中输入arp -a并按回车来列出同一局域网下的所有设备。当中的Internet地址即为IP地址，物理地址又名MAC地址。目前看来树莓派3b的MAC地址都是以B8-27-EB开头的，列表当中MAC地址以B8-27-EB开头的设备对应的IP地址即为我们所找的IP地址。

### 使用ssh工具连接

**树莓派的默认用户是pi，密码是raspberry。**

