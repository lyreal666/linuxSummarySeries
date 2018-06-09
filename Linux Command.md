#                                 Linux Command

## 系统基础相关

- 切换root用户 	`su`
- 临时root权限    `sudo`
- 重启机器    `reboot`
- 关机    `poweroff`
- 退出    `logout/exit`

进入终端的两种方式:

1. cli虚拟控制台,通过ctrl + alt + F1~F7进入,linux系统启动时会自动创建多个虚拟控制台

   其中F1表示打开第一个虚拟终端,打开后屏幕上的tty(打字打字机)X表示第X个终端

2. 第二钟方式是使用发行版的图形化终端仿真器如Gnome Termial,Xterm,KConsole,

   这些图形化化终端仿真器是通过访问CLI来工作的,根据不同的发行版，进入方式不一样，

   gnone桌面通过application进入,Unity桌面直接桌面右击选择terminal;

3. xterm是一个最古老也是第一个可用的CLI仿真器,xterm出现在xwindow软件包之前,可以仿真大量旧式终端,通过xterm + 参数来实现仿真定制,通过xterm 命令调出xterm仿真器

## 帮助命令

- command --help 或-help 或-h 

- help command # 使用help程序

- man command  # 查看文档

  + man手册显示的内容从上到下是有规律的一把是name, sonopsis等
  + man手册按命令的种类分成1-9块区域，一个命令可以属于多块，使用man 1 hostname就是查看他可以执行程序或shell命令部分,man 7 hostname查看概览约定以及杂项部分
  + man -k keyword 当你记不清命令名字时可以用关键字搜索

- info command  # 使用info程序

  

## 常用命令或快捷键

1. 清除屏显 clear 或 ctrl+l 或reset
2. 使用tab键自动补全,可以补全的包括路径,环境变量啊等,如果有前缀相同的，按两下tab键会列出所有前缀相同的命令或路径,比如敲pro后按两下tab,显示所有pro开头的命令或路径
3. 复制粘贴,linux的复制只需要光标选中了,就会复制选中区域到缓冲区,然后按下鼠标滚轮点就会粘贴到当前光标所在位置

### 路径以及文件操作

- 显示当前路径		`pwd`(print workstation directory)

  >`.` 表示当前路径
  >
  >`..` 表示父级路径
  >
  >`/` 表示根路径
  >
  >lunux 文件路径分隔符是顺斜杠`/`  如: /etc/profile
  >
  >.log 日志文件
  >
  >.tr trace跟踪文件
  >
  >文件通配符:
  >
  >1. `?` 表示单个任意字符
  >
  >2. `*`表示任意个任意字符
  >
  >3. `[abc]`类似正则的中括号表示其中之一,其它例子`[a-z]`
  >
  >4. `!`表示不匹配,如: [!a],表示不匹配`a`
  >
  >   举个例子: [!a]*.[bg]z表示不以a开头，后缀名为bz或gz,a和.之间有任意个字符的字符

- 切换工作路径    `cd dir` 

- 切换上次所在路径    `cd -`

- 切换到家路径    `cd ~` 或 e直接cd

- 创建目录    `mkdir dir`  # (make directory)  递归加`-p`

- 删除文件或目录    `rm -rivf`  # `-r`表示递归，删除文件夹必须加，`-v`(view)删除时屏幕显示删除过程, `-f`(force) 不询问  `-i` 删除前询问

- rmdir 删除空目录,没有i选项

- 创建文件

  - `touch fileName` 创建空文件,touch命令会改变文件修改时间, touch -a改变访问时间
  - `vim fileName`

- 显示目录内容    `ls`  # 默认显示当前目录

  - `-l`  long,长模式，单行且显示基本信息

  - `-a`  all,显示所有内容，包括`.`开头的隐藏文件

  - -R 递归显示，碰到目录较多的情况可能会很慢，有点类似tree命令

  - -F 显示文件类型，如果是目录后面就会加`/`，如果加了`l`参数这个参数就没必要

  - -d 只显示自身信息，ls -d 结果只显示`.`,因为默认ls的目录就是`.`,只显示自身，那么显示`.`喽

  - --time=atime 显示访问时间而不是修改时间

  - -i 查看inode编号,inode编号是linux内核分配给文件系统中每个对象的唯一标识符

  - >#### 文件权限 例如: drwxr-xr-x 
    >
    >第1个字母: `d`(文件夹)，`-`普通文件，c字符型文件，b块设备，l开头表示链接；
    >
    >第2~4个字母:  这三个是当前用户权限, `-`表示没权限，2~4分别加上`r, w, x`,分别表示当前用户具有读,写,执行权限；
    >
    >第5~7个字母: 表示用户所在组用户权限
    >
    >第8~10个字母: 所有用户权限



- `ll` 是`ls -l`的别名，使用`alias`查看系统定义的所有别名，使用`alias la="ls -a"定义别名

- 拷贝文件    cp source dest

  + 好习惯是加上-i 参数提醒你是否覆盖同名文件

  + dest为文件时,拷贝过去的文件和dest里面的名字一样
  + 在拷贝一个文件时，dest如果是目录应该在目录名后面加`/`,不加可能有问题，比如如果dest不存在，就会创建一个dest文件; 如: cp a.txt /etc/test,test不存在就会创建/etc/test,这和a.txt是一样的文本,而没有提示错误
  + `cp source1 source2 ... dest` # 可以一次拷贝多个文件

- 移动文件    `mv source1,source2 ... dest` # 可以一次移动多个文件

- 重命名    `mv oldName newName`

- 查看文件类型 file

  1. 对于文本类型，会显示字符集
  2. 对于程序,会显示来源
  3. 对于路径显示，显示是个路径

- 查看整个文本 `cat` 下面是参数说明

  + -n  显示行号
  + -b  空号不算行号
  + -T  制表符替换成`^I`

- 分页查看文本工具 more

- `less is more `  more程序的升级版less

  + 使用h查看下列参数说明

  + q 退出
  + f 或空格或page down向下翻页
  + b或page up往回翻页
  + e或j 或ctrl + n,或Enter 下一行
  + y或k或ctrl+p前一行
  + n + d 下n行

- 查看文件最后几行 tail

  + 默认显示末尾10行
  + -n 指定显示行数
  + -f 实时显示
  + -n  +[num]或-n -[num]从第n行货倒数第n行开始显示

- 查看环境变量中某程序所在路径    `which program`

- 统计文本行数，字符个数等信息    `wc`

- 列出目录树    `tree dir`

1. 链接 对链接的读写会转换为对源文件的读写
   + 软链接(符号链接)	通过ln -s source dest创建,链接创建的是独立的文件，通过ls -i 查看文件inode编号就知道了, ls -l可以看到类型标志`l`
   + 硬连接 通过ln source dest创建, 本质上和原文件属于同一个文件,只是原文件的引用,ls =l看不`l`标志
   + 个人理解硬连接就是在虚拟目录表中多个点指向同一个文件，类似于引用计数的方式，硬连接之间是等价的，也许最初的文件也可以理解为一个硬连接,软链接只是新建一个文件，里面保存了他链接文件的信息

## 系统管理命令

### ps

用途: 查看进程相关信息

显示内容说明:

1. PID 进程id

2. TTY 电子打字机，就是说明属于哪个终端唤起来的

3. TIME 进程启动时需要的累计占用cpu时间

4. CMD 命令

5. S 进程状态 O正在运行 S休眠 R表示可以运行,等待运行 Z僵死进程 T代表停止

   >**孤儿进程：一个父进程退出，而它的一个或多个子进程还在运行，那么那些子进程将成为孤儿进程。孤儿进程将被init进程(进程号为1)所收养，并由init进程对它们完成状态收集工作。**
   >
   >　　**僵尸进程：一个进程使用fork创建子进程，如果子进程退出，而父进程并没有调用wait或waitpid获取子进程的状态信息，那么子进程的进程描述符仍然保存在系统中。这种进程称之为僵死进程。**

6. UID 所属用户id

7. PPID 父进程id

8. C  进程整个生命周期占用cpu时间

9. PRI  优先级,pri越大,优先级越低

10. NI  nice值，有叫谦让度

11. ADDR  进程内存地址

12. SZ  如果进程被换出去,需要的交换空间大小

13. WCHAN 进程休眠的内核函数地址

#### unix风格参数

1. -e 显示所有进程
2. -f 显示完整格式输出
3.  -l 再次扩展楼上输出

#### BSD风格 

就是没有参数前面的横杠

参数和楼上类似

#### GNU长参数

复制了unix和bsd风格参数，增加了一些长参数

--forest 显示进程层级信息

#### 常用组合

ps aux 和楼下一样，二选一，这是BSD风格嘛

ps -elf 或-ely unix风格

ps axjs显示--forest功能

### top

实时检测进程信息

运行top程序后以下单字符可以操作top程序

d 设置轮询间隔

f 设置显示的排序方式

q 退出

top在检测系统异常的时候很有用

## 解压缩

linux支持4种压缩,bzip2(.bz2),zip(zip),gzip(gz),compress(Z);compress快没人用了

zip和gzip命令类似

### gzip

gzip参数:

-c 压缩后保留原文件

-v 在屏幕上显示压缩信息

-f  重复压缩以及压缩连接不提醒

-r 在指定目录递归压缩文件

-l  list 查看压缩包内内容不解压

-d dcompress解压缩

注意: gzip只能压缩文件，不能压缩目录，需要压缩一个目录时可以:

1. 使用tar命令归档(打包)一个目录成一个文档
2. 再使用gzip压缩这个归档文件，后缀.tar.gz

### tar

归档命令,打包

tar参数:

-c create 创建归档

-x exact 解压tar包

-t 列出tar包内容不解压

-C 切换到指定目录

-f 指定flie，一般都要加上

-z 将结果输出给gzip

其它很多和gzip类似

```shell
# 压缩
gzip -cvf filename
# 解压缩
gzip -dvf filename
# 打包
tar -cvf dir
# 解压tar包
tar -xvf dir
# 解压tgz tar包被gzip压缩
tar -zxvf filename
# test目录有f1.txt,f2.txt,test2,test2目录有f3.txt
gzip -rvf test # 上面列出的文件都被压缩
```





## 网络相关

1. 查看ip信息`ifconfig`

   >**IP**
   >
   >ip分5类,A,B,C,D,E
   >
   >A: 1~126 一般用于大型网络公司，国内好像没有，网络段前1字节
   >
   >B:128~191 中型网络，网络段前2字节
   >
   >C:192~223 小型局域网，网络段前3字节
   >
   >D：224~255 广播，直播。。。。
   >
   >
   >
   >IP第四个字节如果是0,一般表示网关    
   >
   >

   

   

   

2. 测试网络连接    `ping -s -i -c` # -s 发包大小， -i interval 间隔， -c count -W timeout

   >返回参数说明:
   >
   >1. `ttl` time-to-live 每次经过一次路由转发就减去1,也就是最大转发转发次数
   >2. time 发包到接受到包的时间
   >3. `ICMP` tcp的一个子协议，用于收发网络报文, `ping` 和`telnet`就是用ICMP协议

3. 获取网页内容

   - `curl <url>` # 默认屏幕上显示爬取内容
   - `wget <url>`  # 默认将爬取内容保存当前路径
   - `telnet ip port` #0~1023是系统保留端口

4. 压力测试工具ab

   ab -c 1000 -n 100 # 模拟1000个并发数,模拟100次 -c concurrentcy -n number

5. 网络跟踪工具 

   + traceroute
   + mtr 实时

6. 路由 route

   + route 显示路由表
   + route add -net ip netmask + 子网掩码 + 网卡 (reject)? # 添加路由，网卡类似于dev eth3,eth表示以太网 ,reject表示拦截请求
   + route del -net ip netmask + 子网掩码 + 网卡 (reject)? # 删除路由 reject取决于你要删除的路由是否reject

   

   