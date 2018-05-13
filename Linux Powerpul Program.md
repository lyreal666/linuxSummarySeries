# Linux Powerpul Program

## 1. sed

![sed --h显示结果](F:\codingSpace\linuxSummarySeries\screenshot\linuxProgram\sed.png)

>### 关键知识点:
>
>1. **sed**总是以行对输入进行处理 (类似nodejs readline模块)
>2. **sed**处理的是原文件的拷贝
>3. **sed**行号从**1**开始
>
>### 基本格式:
>
>`sed` `[addr1]` `[ addr2]` `function [argument]`
>
>### 说明:
>
>`function [argument]`表示函数参数，**sed**内置一系列函数参数，又叫命令
>
>1. `-e` 多点编辑,对同一行执行多条命令
>2. `-n` 和`p`命令配合只显示匹配结果
>3. `-i` 直接编辑选项,处理完的结果直接覆盖原文件
>4. 一般使用`/`分隔命令和参数(定界符),也可以用`:`,`|`
>
>可以用顺斜杠转义
>
>5. `|`可以组合多个表达式sed  '表达式' | sed '表达式' 等同于sed '表达式;表达式'
>6. `-f scriptfile` 指定运行脚本
>
>### sed中可直接使用的RE：
>
>`*  .  ^  $  [  ]  /  c `
>  /w ( 相当于`[A-Za-z_] `)  /W ( 相当于`[^A-Za-z_]` ) 
>  sed中需转义使用的RE：
>`+  ?  {  }  (  )  |  <  > `
>  其他：
> ` /d (d)  /D (D)  /s (s)  /S (S) `
>  匹配 单引号’ 用双引号
>  匹配 反引号` 用单引号
>  /b 匹配单词的前或后边界 ( 字符`[^A-Za-z0-9_]`均构成单词边界 )
>  /B 匹配单词的非边界 ( 字符`[^A-Za-z0-9_]`均构成单词边界 )
>  /< 匹配单词的位置前 ( 字符`[^A-Za-z0-9_]`均构成单词边界 )
>  /> 匹配单词的位置后 ( 字符`[^A-Za-z0-9_]`均构成单词边界 )
>  支持十进制，格式为“/d + 两位或三位十进制数”，如“/d065 或/d65 均代表字符 A ”
>  支持十六进制，格式为“/x + 两位十六进制数”，如“/x61 代表字符 A ”
>  支持八进制，格式为“/o + 两位或三位八进制数”，如“/o077 或/o77 均代表字符 ？，/o101代表字符 A ”
>
>### 参考文章
>
> [sed  识别regexp](https://blog.csdn.net/zhangbg/article/details/6246648  )
>
>[shell学习之-sed用法解析  ](https://blog.csdn.net/zg_hover/article/details/1804481  )
>
>[linux官方教程](https://m.baidu.com/sf/lj?ext=%7B%22url%22%3A%22%2Ffrom%3D1011440l%2Fbd_page_type%3D1%2Fssid%3D0%2Fuid%3D0%2Fpu%3Dusm%25402%252Csz%2540320_1001%252Cta%2540iphone_2_8.0_3_537%2Fbaiduid%3DE5E9776868EC99F0C649A01EEAB9F2D1%2Fw%3D0_10_%2Ft%3Diphone%2Fl%3D3%2Ftc%3Fref%3Dwww_iphone%26lid%3D12412862967799400322%26order%3D1%26fm%3Dalop%26waplogo%3D1%26h5ad%3D1%26srd%3D1%26dict%3D32%26tj%3Dwww_normal_1_0_10_title%26vit%3Dosres%26waput%3D3%26cltj%3Dnormal_title%26asres%3D1%26title%3Dsed%25E5%2591%25BD%25E4%25BB%25A4_Linuxsed%25E5%2591%25BD%25E4%25BB%25A4%25E7%2594%25A8%25E6%25B3%2595%25E8%25AF%25A6%25E8%25A7%25A3%253A%25E5%258A%259F%25E8%2583%25BD%25E5%25BC%25BA%25E5%25A4%25A7%25E7%259A%2584%25E6%25B5%2581%25E5%25BC%258F%25E6%2596%2587%25E6%259C%25AC...%26wd%3D%26eqid%3Dac43591a6148c800100000065af7cb81%26w_qd%3DIlPT2AEptyoA_yimGUPhZGS%26tcplug%3D1%26sec%3D29741%26di%3D587eb626a6b0f4d0%26bdenc%3D1%26nsrc%3DIlPT2AEptyoA_yixCFOxXnANedT62v3IGxOP_yJR0CummUjthPXrZQRAUTLr%22%2C%22frame_only%22%3A1%2C%22lid%22%3A%2212412862967799400322%22%7D&pd=mms_mip&actname=introduction&ms=1&title=sed%20%2F%24  )
>
>



>###  删除
>
>1. `sed -e '1d' inputfile` 删除第一行
>
>   那么删除第x行呢?第x1,x2,x3行呢?
>
>   `sed -e 'xd' inputfile`
>
>   `sed -e 'x1d' -e 'x2d' -e 'x3d' inputfile`
>
>2. `sed -e '1,3d' inputfile` 删除1~3行
>
>   思考: 删除m~n行? 也就是
>
>   `sed -e 'm,nd' inputfile`
>
>   **$**表示最后，那么
>
>   `sed -e 's,$d'`表示删除s行到最后
>
>   但是`^`并没有类似效果
>
>3. `sed -e '/#/d' inputfile `表示删除含有`#`的行
>
>   so,`sed -e '/xx/d' inputfile` 表示删除含有`xx`的行
>
>   `sed -e '/xx/!d' inputfile` 表示删除所有不含`xx`的行
>
>4. `sed -e '/xx/,/yy/d' inputfile` 表示从包含`xx`的行一路删道包含`yy`的行
>
>   so,`sed -e 'x,/word/d' inputfile` 表示删除从x行到包含`word`的行·
>
>5. `sed -e '/ly[0-8]/{1-7/}/d' inputfile` 删除包含指定正则表达式的行 例:"1y2334"
>
>    
>
>

### 替换

1. 替换整行 **c**命令

   单地址:

   `sed -e '1c#!/bin/more' inputfile` 把第一行替换成#!/bin/more

   so, 把某行替换成newstr就是:

   `sed -e 'xc/newstr' inputfile`

   `sed -e '/ly/c/hhh' inputfile`



​	双地址:

​	`sed -e '1,2chhh' inputfile` 把1,2行替换成`hhh`

​   `sed '/^'"'"'/,$clalala' lines.txt` 从包含单引号开头的字符串到最后替换成lalala

​      上面单引号里面用单引号考虑分段的方式写，即将单引号包在双引号里面,前后用被单引号括起来的俩段连起来

2. 替换匹配字符串, **s**命令 英文`substitude`

   一个复杂的正则示例:

   `sed 's/http:\/\/[0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}:[0-9]\{0,4\}/one link/' lines.txt ` 将一个连接的`path`前面字符串替换成`one link`

   一般语法: `sed 's/pattern/repStr/' inputfile` 注意最后的`/`

   到这里可以理解为什么sed正则表达式不支持空格符转义`\s`了，`\s`在sed中被转义成普通`s`，

   `\d`也是被转义成了普通`d`，可能sed在解析s命令和d命令会与`\s`,`\d`冲[突吧；

   + 两个特殊字符

     + & 表示匹配到的字符
     + \x 例如表示匹配到的第x组

     ```shell
     sed 's/[0-9]+/<&>/' lines.txt # 例如 'abc123' => 'abc<123>"
     sed 's/http:\/\/\([0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\):[0-9]\{0,4\}\w*/\1/' lines.txt # 将连接替换成ip
     ```

   + flags 匹配模式

     + `g` 全局模式，替换行内字符串匹配到的所有字符串

     ```shell
     sed 's/ly/lyreal666/' lines.txt # 对每一行匹配到的第一个字符串替换
     sed 's/ly/lyreal666/g' lines.txt # 对每一行匹配到的所有字符串替换,即所有输入的文本字符串
     
     sed 's/ly/lyreal666/2' lines.txt # 对每一行替换匹配到的第二个ly成lyreal666
     
     sed 's/ly/lyreal666/p' lines.txt # 效果就是替换后匹配行在标准输出重复打印一行
     sed -n 's/ly/lyreal666/p' lines.txt # 只打印替换后的匹配行
     
     sed 's/ly/lyreal666/w out.txt' lines.txt # 被替换过的行输出到out.txt
     
     sed '1,6 s/ly/lyreal666/' lines.txt # 只处理1~6行
     sed '/12/ s/ly/lyreal666/' lines.txt # 对所有含有12的行处理
     sed '/#/,$ s/ly/lyreal666/' lines.txt # 从第一个含有#开始往后处理
     
     sed '1 s/$/hhhhhh/' lines.txt # 在第一行最后插入hhhhh
     ```

     + `num` 数字模式,替换行内第`num`个匹配字符串 配合`g`使用`Ng`模式
     + `p`模式
     + `w file2`  将替换后的所有行输出到file2

   + 位置参数，在前面加上就行

### 插入
1. `i`命令

   基本格式: `sed 'addr i\insertStr' fileinput` 插在行前

   不同于`s`命令，`s`命令可以有两个地址参数,`i`命令只有一个;

   ```shell
   sed '1 i\ #!/bin.env' lines.txt # 地址参数和i命令之间空格
   
   sed '/ly\d/a\here' lines.txt # 在包含'lyd'的行后面一行插入here
   
   sed '/ly\d/r out.txt' lines.txt  # 最后没有/
   
   sed '/ly/w out.txt' lines.txt # 包含ly的行都被写近out.txt
   
   sed '/ly\d/ { n; s/ly/lyreal666/ }' lines.txt #包含'lyd'的所有行下一行的ly被替换成lyreal666
   ```

2. `a`命令

   类似`i`命令，不过是在匹配行下一行

3. `r` 命令从文件读出插在指定行后面

4. `w`命令,写喽

5. `n`命令，格式`sed 'addr' { n; otherCommand}`

### 打印
1.`p`命令，在匹配行重复打印一次

一般配合`-n`只打印匹配行，

`sed -n '/fi/,/if/ p'  inputfile`打印`if`和`fi`之间的内容

### 其他命令

1. `y` 按字母对应关系变形，又叫字元替换

```shell
sed '1,5 y' lines.txt

sed -e '/ly/h' -e '$G' lines.txt # 文件末尾添加最后一次保持的包含ly的行

sed -e '/ly\d/h' -e '/66/x' lines.txt # 找到包含66的行替换保持区的行

sed -n '/test/!d' lines.txt # 删掉不包含test的行

sed -e '/test/n' -e 'p' # 打印包含test的行的下一行
```

 和`s`命令的区别

>1、sed 's/dog/cat/' data     把data中的所有行中的第一次出现dog的替换成cat，（注意：如果cat/后没有出现其他形式，则默认时第一次出现的位置）
>
>2、sed '1,3y/abc/ABC/' data    把data中的第一行至第三行中的a替换成A，b替换成B，c替换成C
>
>3、sed '2,${s/dog/cat/1}' data   把data中的第二行至最后一行的第一次出现dog的替换成cat

2.`h`和`G` 保持和获取

3.`x`和`h` 保持和替换

4.`!`反相命令，就是执行匹配行之外的行

### 命令的复用

1. `sed 'expr1; expr2'`
2. `sed -e expr1 -e expr2`



