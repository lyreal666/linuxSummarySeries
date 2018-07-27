# GitHub基本使用教程

## 分以下步骤

1. 注册账号以及邮箱验证，配置账号信息
2. 配置git bash (windows 用户)
3. 配置SSH
4. 常用命令

### 注册邮箱以及邮箱验证 配置账号信息

1. 进入gitHub[首页](https://github.com)或者[注册页面](https://github.com/join?source=experiment-header-dropdowns-home)注册一个账号
2. 注册成功后进入注册邮箱点击验证链接输入账号密码在邮箱中登入gitHub即验证成功
3. 点击右上角头像图标,点击profile,进入配置账号
4. 左侧列表列出一系列配置项,在account项中点击右侧`upload picture上传头像图片`

### 使用git bash

1. windows用户在仓库目录下打开git bash,可以先在资源管理器中先进入仓库目录,右击选择git bash here,也可以按`F4`在地址栏输入git bash
2. 初次使用git，使用下面命令配置全局账号

```shell
$ git config --global user.name "Your Name"
$ git config --global user.email "email@example.com"
# 名字最好不好用空格隔开, "Your Name" 替换成你想取得用户名
# 使用git 的 config 命令配置账号, --global参数表示全局用户
```

3. 当你要新建一个本地仓库(repository), 比如你想创建一个文件夹**exampleRepository**作为一个仓库。首先进入该文件夹,然后使用`git init`命令初始化这个文件夹为仓库, 会在当前目录生成.git文件夹,以`.`开头的文件都是隐藏文件。

   有`.git`文件夹的文件夹都是仓库

### 配置SSH

1. 进入ssh配置目录

   ```shell
   # 即进入家目录下面.shh文件夹
   $ cd ~/.ssh/
   Administrator@THINKPAD ~/.ssh
   # 使用ls命令查看当前路径下的东西
   $ ls
    known_hosts
   ```

2. 使用`ssh-keygen`命令,`-t`参数指定密钥类型为`rsa`类型,`-C`参数指定`comment`(这里可以填邮箱账号)。如果一切顺利的话，可以在用户主目录里找到`.ssh`目录，里面有`id_rsa`和`id_rsa.pub`两个文件，这两个就是SSH Key的秘钥对，`id_rsa`是私钥，不能泄露出去，`id_rsa.pub`是公钥，可以放心地告诉任何人。 

   ```shell
   $ssh-keygen -t rsa -C "email@example.com"
   ```

3. 使用`cat`命令打印`id_rsa.pub`内容, 光标选中后进入github 的 setting页面, 选择“SSH and GPG keys”页面：

   然后，点“Add SSH Key”，填上任意Title，在Key文本框里粘贴`id_rsa.pub`文件的内容

4. 测试是否成功

   ```shell
   $ ssh -T git@github.com
   Hi user! You've successfully authenticated, but GitHub does not provide shell access.
   ```

### 常用命令

1. `git init`    将当前文件夹初始化为仓库, 生产**.git**文件夹

2. `git add -A` 或 `git add .`

   >git add . ：他会监控工作区的状态树，使用它会把工作时的**所有变化提交**到暂存区，包括文件内容修改(modified)以及新文件(new)，但不包括被删除的文件。
   >
   >git add -u ：他仅监控**已经被add的文件**（即tracked file），他会将被修改的文件提交到暂存区。add -u 不会提交新文件（untracked file）。（git add --update的缩写）
   >
   >git add -A ：是上面两个功能的合集（git add --all的缩写）

3. `git commit -m "comment msg"`    将暂存区的内容添加到版本库

4. `git remote add origin repositoryAddress`    例如:

   ```shell
   $ git remote add origin git@github.com:lyreal666/miscellaneous.git
   # remote 远程命令
   # origin 为后面远程仓库服务器地址别名
   ```

5. `git push origin -u master`    将主分支推送到远程**origin**指向的服务器地址

6. `git log`    查看提交历史

7. `git status`    查看文件状态

