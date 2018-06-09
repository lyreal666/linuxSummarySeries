# Variables in shell 

### 定义

形式: varName=varValue 

```shell
[root@iZwz9hq73hyxeo73mbjm4dZ ~]# email='2306709476@gmail.com'
[root@iZwz9hq73hyxeo73mbjm4dZ ~]#
```

注意:

1. `=`号后面没有空格
2. 如果varValue之间有空格可以用引号括起来,如: ICMP='Internet control message protocol'
3. 命名只能使用英文字母，数字和下划线，首个字符不能以数字开头。
4. 不能使用标点符号。
5. 不能使用bash里的关键字（可用help命令查看保留关键字）。

### 引用

完整形式: ${varName}

简写: **$**varName

```shell
[root@iZwz9hq73hyxeo73mbjm4dZ ~]# author=ly
[root@iZwz9hq73hyxeo73mbjm4dZ ~]# echo $author
ly
root@kali:~# author='ly'
root@kali:~# echo ${author}
ly
root@kali:~# vendor="hp"
root@kali:~# echo "It's ${vendor}Computer" # 这个地方就必须用完整形式了
It's hpComputer
root@kali:~# echo "It's $vendorComputer"
It's # 打印出错

```

### 只读变量

readonly 要设定只读变量