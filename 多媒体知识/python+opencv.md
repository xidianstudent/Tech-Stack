#Mac平台搭建Python2.7+Opencv开发环境
>简要记录mac平台搭建python+opencv开发环境所使用的基本技能和踩过的坑。

####一.Mac环境变量设置
>Mac一般用bash作为默认的shell，另外一个shell是zsh，两个shell环境变量设置的地方是不一样的。

#####Mac环境变量加载顺序
1. /etc/profile  (系统级别，开启即加载)
2. /etc/paths    (系统级别，开启即加载)
3. ~/.zshrc         (zsh shell下使用，用户级别)
4. ~/.bash_profile （bash shell下使用，用户级别）
5. ~/.bash_login    (bash shell，用户级别)
6. ~/.profile       (bash shell，用户级别)
7. ~/.bashrc        (bash shell打开时加载，用户级别)

#####环境变量添加方法
>打开上面的文件，输入下面类似代码
>
>export PATH=/opt/local/bin:/opt/local/sbin:$PATH

####通过HoneBrew安装python,pip和opencv
>brew是Mac上安装第三方app的利器，而pip是管理python第三方库的利器。

#####通过brew安装python
> brew install python

#####通过brew安装pip
> brew install pip

#####通过brew安装opencv
> brew install opencv

正常情况下，python，pip和opencv都应该已经安装完成。
> 坑1:如何与系统自带的python版本进行区分？
> 
> 通过brew安装的所有程序，安装路径在：/usr/local/Cellar，会同步到/usr/local/bin目录下。而系统自带的程序在：/usr/bin。
> 
> 具体用哪个版本的python呢？
> 
> 这个时候就需要用到上面提到的环境变量的设置。当执行一个命令时，如python，程序会根据环境变量配置文件中注册的路径逐条寻找，如果/usr/bin在usr/local/bin之前，就会先执行系统自带的python命令，所以要执行brew安装的python，就要将usr/local/bin放前面。
> 
> 使用命令：which python   查看python命令路径，如果是/usr/local/bin/python的话，说明正确。

####virutalenv和virtualenvwrapper
>为了兼容多个python版本，最好使用virtualenv和virtualenvwrapper进行python版本管理。

#####安装virutalenv和virtualenvwrapper
>pip install virutalenv virtualenvwrapper

virtualenvwrapper.sh文件应该已经保存在/usr/local/bin目录下

>vi ~/.bash_profile   打开文件，添加如下代码
>
>source /usr/local/bin/virtualenvwrapper.sh
>
>source ~/.bash_profile

#####创建新的python环境
>mkvirtualenv cv

#####激活python环境
>workon cv

#####释放python环境
>deactivate

#####删除python环境
>rmvirtualenv cv

接下来，就可以在cv环境下应用python了。

####使用opencv
>前面已经通过brew安装了opencv，安装目录在/usr/local/Cellar目录下，记下来需要将对应python版本的cv2.so拷贝到cv环境的sitepackages目录下。

#####cv2.so路径
>/usr/local/Cellar/opencv/3.3.1_1/lib/python2.7/site-packages／cv2.so

拷贝到cv目录下。然后就可以开始opencv的编程了。