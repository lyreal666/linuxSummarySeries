# Mysql

## 检查Mysql是否启动的3种方法

1. ps -el | grep mysqld
2. netstat -anp | grep 3306
3. pgrep mysqld

## 查看mysql内置变量

1. 查看mysql版本 show variables like varname

## 修改数据库密码

分两种情况:

1. shell 命令行

   运行mysql自带bin程序mysqladmin

2. mysql 交互界面

   set password for account=password("newPassword")

注意:

1. 如果设置了密码, 使用mysql -u -p命令登入时,-p和密码之间不能有空格,原因应该密码从-p后就开始计算,如果有空格,空格应该会被算作密码一部分

## 数据库相关sql语句

1. 登入 mysql mysql -uAccount  -pPassword
2. 显示所有数据库 show databases
3. 使用数据库 use databaseName
4. 创建数据库 create database databaseName
5. 删库 drop databaseName
6. 

```shell
[root@iZwz9hq73hyxeo73mbjm4dZ ~]# mysql -uroot -p5391848
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 53
Server version: 5.7.22 MySQL Community Server (GPL)

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| ytj                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use ytj
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> 

```



##表相关sql语句

1. 显示所有表 show tables

2. 创建表 create table users(

   ID int primary key auto_increment, #或者identity(from, step)

   userName varchar(7) not null

   );

3. 查看表结构 desc tableName

4. 删除表 drop table tableName

5. 修改表 

   + 改表名 alter table tableName rename newTableName
   + 增加字段 alter table tableName add newField dest # dest有如下表示
     + first 表示字段加在最前面
     + after field 表示加在某字段后面
   + 删除字段 alter table tableName drop field

6.  清除表记录 delete from tableName

```sql
# 增加字段
alter TABLE users add userAge TINYINT;
```



## CRUD

### insert

标准格式:insert into tableName values(...values)

### select

标准格式: select field from tableName where condition

1. 使用like进行模糊查询
2. 可以使用or,and进行逻辑运算

### update

标准格式: update tableName set field=newValue where condition

### delete

标准格式: delete from tableName where condition



