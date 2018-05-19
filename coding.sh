# 数值测试
strvar1="alice"
strvar2="ab"
strvar3="Bob"

if [ $strvar1 > $strvar2 ]; then
    echo "$strvar1 大于 $strvar2"
else
    echo "$str1 小于等于 $strvar2"
fi

if [ $strvar1 > $strvar3 ]; then
    echo "$strvar1 大于 $strvar2"
else
    echo "$strvar 小于等于 #strvar2"

# 对数字采用标准的数学符号来比较,会把数字当作字符串比较
# 下面代码展示这么做带来的巨坑
ivar1=10000
ivar2=2
if [ $ivar > $ivar2 ]; then
    echo "很显然10000大于2"
else
    echo "傻眼了吧,shell解释器是把他们当字符串比较,先比较首位,1小于2"