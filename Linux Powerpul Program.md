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
>1. `-e` 参数可以一条命令多次操作
>2. `-n` 和`p`命令配合只显示匹配结果
>
>### sed中可直接使用的RE：
>
>*  .  ^  $  [  ]  /  c 
>  /w ( 相当于[A-Za-z_] )  /W ( 相当于[^A-Za-z_] ) 
>  sed中需转义使用的RE：
>+  ?  {  }  (  )  |  <  > 
>  其他：
>  /d (d)  /D (D)  /s (s)  /S (S) 
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



>###  删除
>
>1. `sed -e '1d' inputfile` 删除第一行
>
>   那么删除第x行呢?第x1,x2,x3行呢?
>
>   `sed -e 'xd' inputfile`
>
>   `sed -e 'x1' -e 'x2' -e 'x3' inputfile`
>
>2. `sed -e '1,3d' inputfile` 删除1~3行
>
>   思考: 删除m~n行? 也就是
>
>   `sed -e 'm,nd' inputfile`
>
>   **$**表示最后，那么
>
>   `sed -e 's,$'`表示删除s行到最后
>
>   但是`^`并没有类似效果
>
>3. `sed -e '/#/ ' inputfile `表示删除含有`#`的行
>
>   so,
>
>   `sed -e '/xx/' inputfile` 表示删除含有`xx`的行
>
>   `sed -e '/xx/!d' inputfile` 表示删除所有不含`xx`的行
>
>4. `sed -e '/xx/,/yy/d' inputfile` 表示从包含`xx`的行一路删道包含`yy`的行
>
>   so,
>
>   `sed -e 'x,/word/d' inputfile` 表示删除从x行到包含`word`的行·
>
>5. `sed -e '/ly\d/d' inputfile` 删除包含指定正则表达式的行
>
>   
>
>   
>
>

