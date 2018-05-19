# Shell Script Programing

## 如何使用多个命令?

- 1.**命令1；命令2** ：执行完1再执行2，命令之间没有任何逻辑联系 使用分号隔开即可,如:

```shell
date ; who 
# 显示
# Fri May 18 22:23:45 EDT 2018
# root     :1           2018-05-16 20:22 (:1)
```

- 2.**命令1&&命令2**：&&是一个“自私”符号，即命令1正确我命令2才执行，你错误了我2就不执行。
- 3.**命令1||命令2**：是一个备胎符号，即1不行了2就上，1行的话我就不执行。

## 注释

shell 脚本使用**#**进行注释,如上面的代码

## 创建脚本文件

1. 指定脚本的解释器: 脚本第一行应该使用`#!/bin/bash`
2. 赋予脚本执行权限: `chmod u+x file` # u表示给当前用户加执行权限
3. 编写脚本
4. 执行脚本有以下方式: 
   + 通过绝对路径或相对路径直接运行脚本,如果是当前路径必须用`.`操作符指明是当前文件夹
   + 将脚文件夹添加到Path环境变量中,直接敲脚本名字运行
   + `source filePath`
   + `bash filePath`

## 显示提示语

通过 echo 命令加上你想显示的字符串在屏幕上显示出来

使用-n参数不在显示完字符串后自动换行

-e 参数使字符串中转义字符生效

```shell
#!/bin/bash
echo hello
echo "I'm ly"

echo -n "Let's see the date: "
date
# 上面两行代码显示
# Let's see the date: Fri May 18 22:59:10 EDT 2018

echo -ne "Let's see the date: \n" ; date
# Let's see the date: 
# Fri May 18 23:00:18 EDT 2018

```

## 使用变量

### 环境变量

使用set命令或env命令查看当前环境变量列表

通过$来引用这些环境变量

可以通过转义$输出$,使用echo显示时不需要-e参数使得`\$`生效,其它转义符需要-e参数

```shell
echo $USER # => root
echo "I cost \$25"  # => I cost $15
```

### 用户变量

shell 变量由数字,字母,下划线组成,长度不超过20，区分大小写

使用等号`=`将值赋给变量, 等号左右不允许有空格

引用变量需要用$或者${},给变量赋值不需要

脚本执行完毕,变量会自动删除

```shell
myname="ly"
echo "hello I'm $myname"
echo "oh, welcom! ${myname}"

hisname=myname
echo $hisname # => myname
```

### 命令替换

所谓的命令替换就是将一条命令的执行结果赋值给变量,有一下两种方式:

1. **`**cmd**`** 使用反引号
2. **$(cmd)**

```shell
today=`date +%y%m%d`
echo $today

idf=$(who)
```

### 子shell问题

在使用命令替换时,被替换的命令其实是在一个临时子shell中运行,所以不能使用脚本中创建的变量

在运行脚本的几种方式中:使用`.`和用解释器运行这两种方式会开启一个子shell运行脚本,使用source方式不会

## 重定向

重定向就是改变命令的标准输入输出

一般都是命令在左边,数据在右边

### 重定向输出

使用**>**进行重定向输出 会覆盖原有数据

使用**>>**以追加的形式重定向输出 原有数据追加

```shell
date > date.log
cal > date.log

# date.log 内容
# Sat May 19 01:53:01 EDT 2018
#       May 2018        
# Su Mo Tu We Th Fr Sa  
#        1  2  3  4  5  
#  6  7  8  9 10 11 12  
# 13 14 15 16 17 18 19  
# 20 21 22 23 24 25
```

### 输入重定向

使用**<**表示

**<<**叫做内联输入重定向 需要有开始标志和终止标志,整个输入的开始标志和终止标志要一样

使用内联输入重定向会开启次提示符,不断提示你输入,直到你输入了文本标记,结束输入

```shell
wc < date.log
wc << flag
> hello world
> linux is not unix
> flag

# 9  46 217 行 词和字节数
# 2  6 30

```

常用的输出重定向：

- 1.**命令 >> 文件 2>&1** :以追加的方式，把正确输出和错误输出都保存在文件中。

- 2.**命令&>文件名**：以覆盖的方式将正确和错误输出都保存在文件中。

- 3.**命令&>>文件名**：以追加的方式将正确和错误输出都保存在文件中。

- 4.**命令>>文件A 2>>文件B**：正确的输出到A文件中，错误的输出到B文件中。

  注意：只要涉及到错误输出，>或者>>两侧都不能有空格。

  例子：

   

**关于黑洞：**可以把一些不需要显示的命令丢进黑洞(/dev/null) 

[重定向和管道的一篇文章](https://blog.csdn.net/qq_16811963/article/details/52997178)

## 管道

linux shell 的管道符是**|**,一般形式cmd1 | cmd2

管道用于将一个命令的输出定向到另一个命令的输入,相对于重定向,重定向只能用于流和命令之间的传输

注意: 管道串起来的多个命令是并行的,第一个命令产生输出的同时会被立即送到第二个命令,数据不会经过任何中间件和缓冲区

常使用cmd | less的方式进行分页查询命令结果

## 执行数学运算

shell中的赋值和操作默认都是字符串处理，在此记下shell中进行数学运算的几个特殊方法

[原文链接](https://www.cnblogs.com/liujiahi/archive/2011/03/30/2196400.html)

1、错误方法举例

a)    var=1+1    echo $var    输出的结果是1+1，悲剧，呵呵        

b)    var=1    var=$var+1    echo $var    输出结果是1+1，依然悲剧，呵呵        

2、正确方法    

1)使用let    var=1    let "var+=1"    echo $var    输出结果为2，这次没有悲剧    

注意：   

a)经我测试let几乎支持所有的运算符，在网上看到一篇文章说“let不支持++、--和逗号、(、)”,但经我测试自加、自减、以及括号的优先级都得到了很好的支持    

b)方幂运算应使用`**`    

c)参数在表达式中直接访问，不必加$    

d)一般情况下算数表达式可以不加双引号，但是若表达式中有bash中的关键字则需加上    

e)let后的表达式只能进行整数运算     



2)使用(())    var=1    ((var+=1))    echo $var    输出结果为2    

注意：    (())的使用方法与let完全相同        



3)使用$[]    var=1    var=$[$var+1]    echo $var    输出结果位2    

注意：    

a)$[]将中括号内的表达式作为数学运算先计算结果再输出    

b)对$[]中的变量进行访问时前面需要加$    

c)$[]支持的运算符与let相同，但也只支持整数运算        



4)使用expr    var=1    var=**`**expr $var + 1**`**    echo $var    输出结果为2    

注意：    

a)expr后的表达式个符号间需用空格隔开    

b)expr支持的操作符有： |、&、<、<=、=、!=、>=、>、+、-、*、/、% 

c)expr支持的操作符中所在使用时需用\进行转义的有：|、&、<、<=、>=、>、*

e)expr同样只支持整数运算        



5)使用bc(可以进行浮点数计算)    var=1    var=`echo "$var+1"|bc`    echo $var    输出结果为2    

介绍：    bc是linux下的一个简单计算器，支持浮点数计算，在命令行下输入bc即进入计算器程序，而我们想在程序中直接进行浮点数计算时，利用一个简单的管道即可解决问题。    

注意：    

1)经我测试bc支持除位操作运算符之外的所有运算符。    

2)bc中要使用scale进行精度设置    

3)浮点数计算实例    var=3.14    var=`echo "scale=2;$var*3"|bc`    echo $var    输出结果为9.42        



6)使用awk(可已进行浮点数计算)    var=1    var=`echo "$var 1"|awk '{printf("%g",$1*$2)}'`    echo $var    输出结果为2    

介绍：    awk是一种文本处理工具，同时也是一种程序设计语言，作为一种程序设计语言，awk支持多种运算，而我们可以利用awk来进行浮点数计算，和上面bc一样，通过一个简单的管道，我们便可在程序中直接调用awk进行浮点数计算。    

注意：    

1)awk支持除微操作运算符之外的所有运算符    

2)awk内置有log、sqr、cos、sin等等函数    

3)浮点数计算实例    var=3.14    var=`echo "$var 2"|awk '{printf("%g",sin($1/$2))}'`    echo $var    输出结果为1        

## 补充:

bc :bash计算器,一种编程语言

1. 可以使用浮点运算 测试表明不支持阶乘
2. 使用-q参数运行该程序不会提示版本信息
3. 可以使用注释 #,/* */
4. 注意通过scale来设置精度,scale是一个内建变量,默认小数位0
5. bc中定义的变量,退出bc无效
6. 通过键入quit退出

```shell
root@kali:~/play# bc -q
# comments
/*
multiline comment
*/
scale=2
x=2.5
y=x**2
(standard_in) 8: syntax error
y=x * 2
print y
5.0
quit
root@kali:~/play# 

# 一个脚本示例
root@kali:~/play# ./testbc.sh
the result is 2813.9882
root@kali:~/play# cat testbc.sh 
#!/bin/bash
var1=10.46
var2=43.67
var3=33.2
var4=71

result=$(bc << EOF
scale = 4
a1 = ($var1 * $var2)
b1 = ($var3 * $var4)
a1 + b1
EOF
)
echo the result is $result
root@kali:~/play# 

```

## 退出脚本

### 退出状态码

任何shell程序或命令结束时都会更新一个环境变量**?**

通过$?查看当前执行完程序或命令的退出码

>常见状态码
>
>0: 命令成功执行
>
>1: 一般未知性错误
>
>2: 不合适的shell命令
>
>126: 命令不可以执行
>
>127: 没找到命令
>
>128: 无效退出参数
>
>128+x: 与linux信号x相关的严重错误
>
>130: ctrl+c退出的状态码
>
>255: 正常范围之外的错误码

```shell
root@kali:~/play# cat test.sh
#!/bin/bash
cal
exit 0
root@kali:~/play# echo $?
0
root@kali:~/play# haha
bash: haha: command not found
root@kali:~/play# $?
bash: 127: command not found
root@kali:~/play# touch haha.txt
root@kali:~/play# ./haha.txt
bash: ./haha.txt: Permission denied
root@kali:~/play# echo $?
126
root@kali:~/play# tail -n 5 -f /var/log/syslog
May 19 06:12:11 kali dbus-daemon[455]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
May 19 06:12:11 kali systemd[1]: Started Network Manager Script Dispatcher Service.
May 19 06:12:11 kali nm-dispatcher: req:1 'dhcp4-change' [eth0]: new request (2 scripts)
May 19 06:12:11 kali nm-dispatcher: req:1 'dhcp4-change' [eth0]: start running ordered scripts...
May 19 06:15:01 kali CRON[6483]: (root) CMD (command -v debian-sa1 > /dev/null && debian-sa1 1 1)
^C
root@kali:~/play# echo $?
130
root@kali:~/play# 

```



### exit命令

对shell脚本而言,默认情况是以脚本中最后一条命令的退出状态码退出,也就是说执行完脚本后,你听过$?查看到的退出码是脚本中最后一条命令产生的

exit 命令允许你改变退出子shell时的状态码(脚本是通过子shell运行的)

```shell
root@kali:~/play# cat test.sh
#!/bin/bash
cal
exit 0
root@kali:~/play# echo $?
0
root@kali:~/play# 

```

