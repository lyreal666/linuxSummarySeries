#                                 Linux Command

## 系统基础相关

- 切换root用户 	`su`

- 临时root权限    `sudo`

- 重启机器    `reboot`

- 关机    `poweroff`

- 退出    `logout/exit`

  ​    

  

## 帮助命令

- command --help # 长选项
- help command # 使用help程序
- man command  # 查看文档
- info command



### 路径以及文件操作

- 显示当前路径		`pwd`(print workstation directory)

  >`.` 表示当前路径
  >
  >`..` 表示父级路径
  >
  >`/` 表示根路径
  >
  >lunux 文件路径分隔符是顺斜杠`/`  如: /etc/profile

- 切换工作路径    `cd dir` 

- 切换上次所在路径    `cd -`

- 切换到家路径    `cd ~`

- 创建目录    `mkdir dir`  # (make directory)  递归加`-p`

- 删除文件或目录    `rm -rvf`  # `-r`表示递归，删除文件夹必须加，`-v`(view)删除时屏幕显示删除过程, `-f`(force) 不询问

- 创建文件

  - `touch fileName`
  - `vim fileName`

- 显示目录内容    `ls`  # 默认显示当前目录

  - `-l`  long,长模式，单行且显示基本信息

  -  `-a`  all,显示所有内容，包括`.`开头的隐藏文件

  - >#### 文件权限 例如: drwxr-xr-x 
    >
    >第1个字母: `d`(文件夹)，`-`普通文件；
    >
    >第2~4个字母:  这三个是当前用户权限, `-`表示没权限，2~4分别加上`r, w, x`,分别表示当前用户具有读,写,执行权限；
    >
    >第5~7个字母: 表示用户所在组用户权限
    >
    >第8~10个字母: 所有用户权限



- `ll` 是`ls -l`的别名，使用`alias`查看系统定义的所有别名，使用`alias la="ls -a"定义别名

- 拷贝文件    `cp source1 source2 ... dest` # 可以一次拷贝多个文件

- 移动文件    `mv source1,source2 ... dest` # 可以一次移动多个文件

- 重命名    `mv oldName newName`

- 查看文本内容

  - `more filePath`  # 使用more程序相比less不能往回翻页
  - `less filePath` # 使用less程序打开文件内容 有言: `less is more`

  >`q` 命令退出
  >
  >`f` 向文件后面内容翻页
  >
  >`b` 往回翻页

  - `cat filePath`  #  至上而下显示所有内容
  - `tac`  # 自下而上显示所有内容
  - `head [+- number]` # 显示开头几行,通过number加减行
  - `tail[+- number]` # 显示最后几行

- 查看环境变量中某程序所在路径    `which program`

- 统计文本行数，字符个数等信息    `wc`

- 列出目录树    `tree dir`

## 网络相关

1. 查看ip信息	`ifconfig`

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

   

2. 测试网络连接    `ping -s -i -c` # -s 发包大小， -i interval 间隔， -c count

   >返回参数说明:
   >
   >1. `ttl` time-to-live 就是延时timeout
   >2. time 发包到接受到包的时间
   >3. `ICMP` tcp的一个子协议，用于收发网络报文, `ping` 和`telnet`就是用ICMP协议

3. 获取网页内容

   - `curl <url>` # 默认屏幕上显示爬取内容
   - `wget <url>`  # 默认将爬取内容保存当前路径
   - `telnet`