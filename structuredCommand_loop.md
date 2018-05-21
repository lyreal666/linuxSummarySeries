# Shell script - loop statement

## for 循环

基本格式

```shell
# 基本形式1
for var in list
do
    commands
done

# 基本形式2
for vacr in list; do
    commands
done
```

指定list有多种方式:

1. 直接在for in后面列举集合元素

   注意:

   1. in 后面默认是按空白符分隔集合元素的
   2. 如果要打出单引号或双引号,那就双引号里面写单引号或单引号里面写双引号，也可以用转义的方式
   3. 如果元素本身有空格,可以用引号圈起来,这样shell就会把它当作一个词

   ```shell
   root@kali:~/studyShell/conditions# cat -n testStatement.sh 
        1	#!/bin/bash
        2	
        3	# basic define a list
        4	for name in ubuntu kali solus centos
        5	do
        6		echo $name
        7	done
        8	echo $name
        9	
       10	words=""
       11	for word in I\'m going to "New York" "Los Angeles" It"'"ll be fun
       12	do
       13		words="${words} $word"
       14	done
       15	echo $words
   root@kali:~/studyShell/conditions# ./testStatement.sh 
   ubuntu
   kali
   solus
   centos
   centos
   I'm going to New York Los Angeles It'll be fun
   root@kali:~/studyShell/conditions# 
   
   ```

2. 使用集合变量

    ```shell
    root@kali:~/studyShell/conditions# cat -n testStatement.sh 
         1	#!/bin/bash
         2	
         3	namelist="ly jxq rbd fl"
         4	
         5	for name in $namelist
         6	do
         7		echo $name
         8	done
         9	
        10	namelist=$namelist" zjx"
        11	
        12	for name in $namelist
        13	do
        14		echo $name
        15	done
    root@kali:~/studyShell/conditions# ./testStatement.sh 
    ly
    jxq
    rbd
    fl
    ly
    jxq
    rbd
    fl
    zjx
    root@kali:~/studyShell/conditions# 
    ```

3. 从命令读取值

    使用命令替换获取命令输出的数据

    ```shell
    root@kali:~/studyShell/conditions# cat -n testStatement.sh 
         1	#!/bin/bash
         2	
         3	for filename in `ls /`
         4	do
         5		echo "$filename"
         6		if [ -d "/$filename" ]; then
         7			echo "	$filename is a directory"
         8		else
         9			echo "	$filename is file"
        10		fi
        11	done
    root@kali:~/studyShell/conditions# ./testStatement.sh 
    0
    	0 is file
    bin
    	bin is a directory
    boot
    	boot is a directory
    dev
    	dev is a directory
    etc
    	etc is a directory
    
    ```

4. IFS(internal field separater)分隔符

    shell在解析集合时默认的分隔符是空白符,也就是任意连续空格或制表符或换行符

    可以临时修改IFS来满足我们的临时需求

    当从命令读取数据输入时,我们一般都是将换行符作为分隔符而不是空格。

    ```shell
    root@kali:~/studyShell/conditions# cat -n testStatement.sh 
         1	#!/bin/bash
         2	
         3	for state in `cat state.txt`
         4	do
         5		echo $state
         6	done
         7	
         8	OLD_IFS=$IFS
         9	echo "<$IFS>"
        10	
        11	IFS=$'\n':;'"'
        12	
        13	for state in `cat state.txt`
        14	do
        15		echo $state
        16	done
        17	
        18	for field in `cat /etc/passwd`
        19	do
        20		echo $field
        21	done
        22	IFS=$OLD_IFS
    root@kali:~/studyShell/conditions# ./testStatement.sh 
    Los
    Angelos
    New
    york
    California
    Boston
    < 	
    >
    ./testStatement.sh: line 11: ": command not found
    Los Angelos
    New york
    California
    Boston
    root
    x
    0
    0
    root
    /root
    /bin/bash
    daemon
    x
    1
    1
    daemon
    /usr/sbin
    /usr/sbin/nologin
    bin
    x
    2
    2
    bin
    /bin
    /usr/sbin/nologin
    
    ```

5. 通配符读取目录

    可以通过使用通配符的方式来遍历一个目录下的所有文件

    即便是不存在的目录也不会报错

    ```shell
    root@kali:~/studyShell/conditions# cat -n testStatement.sh 
    1	#!/bin/bash
         2	
         3	for file in /root/* /root/play/* /notExist
         4	do
         5		echo $file
         6	done
    root@kali:~/studyShell/conditions# ./testStatement.sh 
    /root/Desktop
    /root/Documents
    /root/Downloads
    /root/Music
    /root/Pictures
    /root/play
    /root/Public
    /root/studyShell
    /root/Templates
    /root/Videos
    /root/play/date.log
    /root/play/grep
    /root/play/haha.txt
    /root/play/hl_lines.txt
    /root/play/lines.txt
    /root/play/ll
    /root/play/out.txt
    /root/play/script.sh
    /root/play/sl_out.txt
    /root/play/test
    /root/play/testAwk
    /root/play/testbc.sh
    /root/play/test.sh
    root@kali:~/studyShell/conditions# 
    
    ```

6. c语言风格的for循环

    ```shell
    root@kali:~/studyShell/conditions# cat -n testStatement.sh 
         1	#!/bin/bash
         2	
         3	for ((a = 1, b = 9; a <= 9 && b >= 1; ++a,--b))
         4	do
         5		echo $((a+b))
         6	done
    root@kali:~/studyShell/conditions# ./testStatement.sh 
    10
    10
    10
    10
    10
    10
    10
    10
    10
    root@kali:~/studyShell/conditions# 
    
    ```

## while

while语句可以指定多个判断命令,在多命令语句中每一次判断所有判断命令会依次执行,最后依次命令的返回码决定是否退出循环

```shell
root@kali:~/studyShell/conditions# cat -n testStatement.sh 
     1	#!/bin/bash
     2	
     3	loopvar=5
     4	while echo "start adjust.."
     5		echo "justing...."
     6		[ $loopvar -gt 0 ]
     7	do
     8		echo "Im inside the loopbody"
     9		echo "loopvar is $loopvar"
    10		loopvar=$[$loopvar-1]
    11	done
root@kali:~/studyShell/conditions# ./testStatement.sh 
start adjust..
justing....
Im inside the loopbody
loopvar is 5
start adjust..
justing....
Im inside the loopbody
loopvar is 4
start adjust..
justing....
Im inside the loopbody
loopvar is 3
start adjust..
justing....
Im inside the loopbody
loopvar is 2
start adjust..
justing....
Im inside the loopbody
loopvar is 1
start adjust..
justing....
root@kali:~/studyShell/conditions# 

```



## until

一直循环直到条件命令返回码为0,换句话说until指定的是退出条件

```shell
root@kali:~/studyShell/conditions# cat -n testStatement.sh 
     1	#!/bin/bash
     2	
     3	loopvar=5
     4	
     5	until
     6		echo "start adjust return condition.."
     7		echo "adjusting..."
     8		[ $loopvar -eq 0 ]
     9	do
    10		echo "I'm inside the loopbody..."
    11		echo "loopvar is $loopvar"
    12		((loopvar--))
    13	done
    14		
root@kali:~/studyShell/conditions# ./testStatement.sh 
start adjust return condition..
adjusting...
I'm inside the loopbody...
loopvar is 5
start adjust return condition..
adjusting...
I'm inside the loopbody...
loopvar is 4
start adjust return condition..
adjusting...
I'm inside the loopbody...
loopvar is 3
start adjust return condition..
adjusting...
I'm inside the loopbody...
loopvar is 2
start adjust return condition..
adjusting...
I'm inside the loopbody...
loopvar is 1
start adjust return condition..
adjusting...
root@kali:~/studyShell/conditions# 

```

### 循环控制

break和continue用来改变循环流程

注意:

1. 当处在多层嵌套循环内时,shell允许你使用break n的形式指定跳出的层数,b为2,,就是跳出最内两层循环
2. 使用continue时，若使用while或until循环注意不要跳过了增量部分代码导致死循环

```shell
root@kali:~/studyShell/conditions# cat -n testStatement.sh 
     1	#!/bin/bash
     2	
     3	loovar=-1
     4	while ((loopvar <= 10))
     5	do
     6		((loopvar++))
     7		if [ $loopvar -ge 5 -a $loopvar -le 8 ]; then
     8			continue
     9		fi
    10		echo "the loopvar is $loopvar"
    11		if ((loopvar==9)); then
    12			break
    13		fi
    14	done
    15	
    16	for ((i=0;i < 5;i++))
    17	do
    18		for ((j=0;j<3;j++))
    19		do
    20			echo "<$i,$j>"
    21			if ((i == 4 && j == 2)); then
    22				break 2
    23			fi
    24		done
    25	done
root@kali:~/studyShell/conditions# ./testStatement.sh 
the loopvar is 1
the loopvar is 2
the loopvar is 3
the loopvar is 4
the loopvar is 9
<0,0>
<0,1>
<0,2>
<1,0>
<1,1>
<1,2>
<2,0>
<2,1>
<2,2>
<3,0>
<3,1>
<3,2>
<4,0>
<4,1>
<4,2>
root@kali:~/studyShell/conditions# 

```

## 处理循环输出

通过在done命令后面使用重定向可以将原本显示在屏幕上的内容定向到文件

可以定向到黑洞/dev/null,达到丢弃输出的目的

还可以将done的输出使用管道导向另一个命令

```shell
root@kali:~/studyShell/conditions# cat -n testStatement.sh 
     1	#!/bin/bash
     2	
     3	for letter in g f h i j k b c a l
     4	do
     5		echo $letter
     6	done | sort
     7	
     8	for letter in g f h i j k b c a l
     9	do
    10		echo $letter
    11	done > /dev/null
root@kali:~/studyShell/conditions# ./testStatement.sh 
a
b
c
f
g
h
i
j
k
l
root@kali:~/studyShell/conditions# 

```

### 实战

列举所有可以直接执行的程序路径

```shell
root@kali:~/studyShell/conditions# cat -n pro1 
     1	#!/bin/bash
     2	
     3	# list all excutable file in the path
     4	OLD_IFS=$IFS
     5	IFS=:
     6	for folder in $PATH
     7	do
     8		echo "folder: $folder"
     9		for file in $folder/*
    10		do
    11			if [ -x $file ]; then
    12				echo "			$file"
    13			fi
    14		done
    15	done
    16	IFS=$OLD_IFS
root@kali:~/studyShell/conditions# ./pro1 
folder: /usr/local/sbin
			/usr/local/sbin/mount-shared-folders
			/usr/local/sbin/restart-vm-tools
folder: /usr/local/bin
folder: /usr/sbin
			/usr/sbin/a2disconf
			/usr/sbin/a2dismod
			/usr/sbin/a2dissite
			/usr/sbin/a2enconf
			/usr/sbin/a2enmod
			/usr/sbin/a2ensite
			/usr/sbin/a2query
			/usr/sbin/aa-remove-unknown
			/usr/sbin/aa-status
			/usr/sbin/accept
...
```

