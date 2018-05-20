# Structurd Command

## 条件语句

shell 使用if-then语句表示条件语句

shell中执行条件后的then语句块不是根据条件的值是true还是false，而是根据条件执行后的返回码是否为0;

换句话说就是如果条件顺利执行,那么条件后then语句块就会执行

比较简单,我直接贴代码

###单条件有下面两种形式

```shell
# 形式1
if cmd; then
	commands
fi

# 形式2
if cmd
then
	eommands
fi

root@kali:~/studyShell# cat conditionStatements.sh 
#!/bin/bash

# returncode is 0
if pwd;then
	echo "returnCode is $?,so I am carried out!"
fi

# happen exception
if notCommand; then
	echo "I'm imposiablly carried out"
fi
echo "I'm outside the condition statement"
root@kali:~/studyShell# ./conditionStatements.sh 
/root/studyShell
returnCode is 0,so I am carried out!
./conditionStatements.sh: line 9: notCommand: command not found
I'm outside the condition statement
root@kali:~/studyShell# 

```

## If else

```shell
root@kali:~/studyShell# cat conditionStatements.sh 
#!/bin/bash

# returncode is 0
if pwd;then
	echo "returnCode is $?,so I am carried out!"
fi

# happen exception
if notCommand; then
	echo "I'm imposiablly carried out"
fi
echo "I'm outside the condition statement"

everUser="lly"
if grep $everUser /etc/passwd; then
	echo "oh $everUser had ever logined my linux system..."
	echo "I actually don't konw!!"
else
	echo "$everUser can't login my linux.."
fi
root@kali:~/studyShell# ./conditionStatements.sh 
/root/studyShell
returnCode is 0,so I am carried out!
./conditionStatements.sh: line 9: notCommand: command not found
I'm outside the condition statement
lly can't login my linux..
root@kali:~/studyShell# 

```

### 多分支语句

```shell
root@kali:~/studyShell# cat conditionStatements.sh 
#!/bin/bash

# returncode is 0
if pwd;then
	echo "returnCode is $?,so I am carried out!"
fi

# happen exception
if notCommand; then
	echo "I'm imposiablly carried out"
fi
echo "I'm outside the condition statement"

everUser="lly"
if grep $everUser /etc/passwd; then
	echo "oh $everUser had ever logined my linux system..."
	echo "I actually don't konw!!"
elif ls /home/$everUser; then
	echo "$everUser can't login my linux.."
	echo "But there is $everUser directory in home" 
else
	echo "The user $everUser doesn't exits on this system"
fi
root@kali:~/studyShell# ./conditionStatements.sh 
/root/studyShell
returnCode is 0,so I am carried out!
./conditionStatements.sh: line 9: notCommand: command not found
I'm outside the condition statement
ls: cannot access '/home/lly': No such file or directory
The user lly doesn't exits on this system
root@kali:~/studyShell# 

```

###test

由于if-then语句只能根据条件执行的返回码来判断是否执行,这显然局限性很大

可以使用test命令来进行更复杂的条件判断,比如测试一个变量是否为空串

如果test后面没有测试条件,返回码为非0

```shell
root@kali:~/studyShell/conditions# cat testStatement.sh 
#!/bin/bash

if test ; then
	echo "test result is true"
else
	echo "test result is false"
fi

if test $myVariable; then
	echo "The test result is Ture"
else
	echo "The test result is False"
fi
root@kali:~/studyShell/conditions# ./testStatement.sh 
test result is false
The test result is False
root@kali:~/studyShell/conditions# 
```

### 条件表达式

可以使用[ condition ]的的形式写条件测试,这样就不用写test了

注意: 左中括号后面和右中括号左边都必须有空格

test命令可以测试下面的三类条件

1. 数值比较
2. 字符串比较
3. 文件比较

#### 数值比较

下面是测试数值的操作符

>-eq 相等
>
>-ge 大于或等于
>
>-gt 大于
>
>-le 小于或大于
>
>-lt 小于
>
>-ne 不等于

```shell
root@kali:~/studyShell/conditions# cat testStatement.sh 
#!/bin/bash

# 数值测试
var1=3
var2=6

if [ $var1 -lt $var2 ]; then
    echo "$var1 小于 $var2"
else
    echo "$var1 大于等于 $vavr2"
fi
root@kali:~/studyShell/conditions# ./testStatement.sh 
3 小于 6
root@kali:~/studyShell/conditions# 

```

### 字符串比较

>= 比较字符串是否相等
>
>!= 比较字符串是否不同
>
>str1 < str2 比较字符串str1是否小于str2
>
>str1 > str2 比较str1是否大于str2
>
>-n str 检查str长度是否非0
>
>-z  str 检查str长度是否为0

注意: 

1. 由于解析上的问题大于号和小于号会被识别为重定向而顺利执行返回码为0，then语句块被执行，所以使用字符串比较时注意转义大于号和小于号
2. sort 命令是根据本地英语设置的排序规则,即小写字母排在大写字母前面,而比较test使用的是标准的ascall码值比较大小,大写字母码值比小写字母小

```shell
root@kali:~/studyShell/conditions# cat -n testStatement.sh 
     1	#!/bin/bash
     2	
     3	# 数值测试
     4	strvar1="alice"
     5	strvar2="ab"
     6	strvar3="Bob"
     7	
     8	if [ $strvar1 \> $strvar2 ]; then
     9	    echo "$strvar1 大于 $strvar2"
    10	else
    11	    echo "$str1 小于等于 $strvar2"
    12	fi
    13	
    14	if [ $strvar1 \> $strvar3 ]; then
    15	    echo "$strvar1 大于 $strvar3"
    16	else
    17	    echo "$strvar 小于等于 $strvar3"
    18	fi
    19	
    20	# 对数字采用标准的数学符号来比较,会把数字当作字符串比较
    21	# 下面代码展示这么做带来的巨坑
    22	ivar1=10000
    23	ivar2=2
    24	if [ $ivar1 \> $ivar2 ]; then
    25	    echo "很显然10000大于2"
    26	else
    27	    echo "傻眼了吧,shell解释器是把他们当字符串比较,先比较首位,1小于2"
    28	fi
    29	
    30	strvar4=''
    31	if [ -z $strvar4 ]; then
    32		echo "strvar4 is empty"
    33	fi
    34	
    35	if [ -z $strvar5 ]; then
    36		echo "undefined test result is false"
    37	fi
    38	
    39	strvar6="ly"
    40	if [ -n $strvar6 ]; then
    41		echo "strvar6 is not empty"
    42	fi
root@kali:~/studyShell/conditions# ./testStatement.sh 
alice 大于 ab
alice 大于 Bob
傻眼了吧,shell解释器是把他们当字符串比较,先比较首位,1小于2
strvar4 is empty
undefined test result is false
strvar6 is not empty

```

### 文件比较

文件测试可能是用的最多的测试

>-d file 检查file是否存在并且是一个目录
>
>-f  file 检查file是否存在并且是一个文件
>
>-e file 检查file是否存在
>
>-r file  存在并可读
>
>-w file 存在并可写
>
>-x file 存在并可执行
>
>-O file 存在并且是否属于当前用户
>
>-G file 存在并且默认组是否属于和当前用户组相同
>
>file1 -nt file2 file1是否比file2新 
>
>file1 -ot file2 file1是否比file老

注意点:最后一组测试不会检测文件是否存在,文件不存在直接返回错误结果，编写安装软件的脚本可能会遇得到

### 条件运算符

和大多数编程语言一样,shell也可以使用短路与`&&`和短路或`||`

```shell
shell
```

### 高级特性

1. 用于数学表达式的双括号 (())
2. 用于高级字符串处理的双中括号[[]]

(())双括号很强大

1. 使用变量时不需要用$
2. 可以直接在(())中定义变量
3. 可以用逗号隔开执行多条运算
4. 支持几乎所有c的运算符

```shell
root@kali:~/studyShell/conditions# cat -n testStatement.sh 
     1	#!/bin/bash
     2	
     3	ivar1=2
     4	((ivar1++))
     5	echo $ivar1
     6	ivar2=4
     7	((ivar2 +=1))
     8	echo $ivar2
     9	((ivar3= 3 > 1 ? 3 : 1))
    10	if ((ivar3 == ivar1)); then
    11		echo "ivar3 equals to ivar1"
    12	fi
root@kali:~/studyShell/conditions# ./testStatement.sh 
3
5
ivar3 equals to ivar1
root@kali:~/studyShell/conditions# 

```

[[]]双中括号支持所有的test字符串比较,但比test比较强大的是多了模式匹配

=~表示正则匹配



```shell
root@kali:~/studyShell/conditions# cat -n testStatement.sh 
     1	#!/bin/bash
     2	
     3	user=$USER
     4	if [[ $user == r* ]] && [[ $user =~ ^r.*?$ ]];then
     5		echo "the user is $user"
     6	fi
root@kali:~/studyShell/conditions# ./testStatement.sh 
the user is root
root@kali:~/studyShell/conditions# 
root@kali:~/studyShell/conditions# cat -n testStatement.sh 
     1	#!/bin/bash
     2	
     3	user=$USER
     4	if [[ $user == r* ]];then
     5		echo "the user is $user"
     6	fi
root@kali:~/studyShell/conditions# ./testStatement.sh 
the user is root
root@kali:~/studyShell/conditions# 

```

### case in

就是高级语言的switch语句,注意以下几点:

1. case in语句每次只能执行一条case分支
2. 分支变量可以用通配符,比如*
3. 使用`;;`结束一个分支

```shell
root@kali:~/studyShell/conditions# cat -n testStatement.sh 
     1	#!/bin/bash
     2	
     3	user1="alice"
     4	user2="bob"
     5	user3="hanmeimei"
     6	
     7	user=$user1
     8	
     9	case $user in
    10		alice | bob)
    11			echo "the user is alice or bob";;
    12		hanmeimei)
    13			echo "the user is hanmeimei";;
    14		*)
    15			echo "the user is others";;
    16	esac
    17	
    18	user=$user3
    19	case $user in
    20		alice | bob)
    21			echo "the user is alice or bob";;
    22		hanmeimei)
    23			echo "the user is hanmeimei";;
    24		*)
    25			echo "the user is others";;
    26	esac
    27	
    28	user="hhhh"
    29	case $user in
    30		alice | bob)
    31			echo "the user is alice or bob";;
    32		hanmeimei)
    33			echo "the user is hanmeimei";;
    34		*)
    35			echo "the user is others";;
    36	esac
    37	
root@kali:~/studyShell/conditions# ./testStatement.sh 
the user is alice or bob
the user is hanmeimei
the user is others
root@kali:~/studyShell/conditions# 

```



