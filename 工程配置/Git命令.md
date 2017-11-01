# Git常用命令
> Git是分布式代码管理系统。Git的几个概念：仓库(Resiposity),分支(Branch)

### SSH生成

### 创建仓库
##### 本地创建目录
> mkdir ./folder
> 
> cd folder

##### 初始化仓库
> git init

### 往仓库添加文件或者文件夹
##### 创建文件
> touch readme.md

> 修改readme.md内容

##### 添加文件或文件夹到Stage中
> git add readme.md

##### 提交文件到master
> git commit -m "commit to master"

##### 提交远程代码仓库
> git push

##### 克隆远程代码仓库
> git clone https://github

##### 远程取代码
> git fetch

##### 获取代码仓库信息
> git status

##### 创建分支并切换分支
> git checkout -b new_branch
> 或者
> git branch new_branch
> git checkout new_branch

##### 合并分支
> git merge new_branch