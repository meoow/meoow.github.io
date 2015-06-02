Title: Yet another way to get self path of currently running bash script.
Date: 2014-12-19 21:17
Modified: 
Category: Article
Tags: 
Authors: meoow
Summary: 
获取运行的脚本自身所在的路径，所面临的最核心的问题就是怎么追踪软链接

尽管Linux的coreutils中的readlink已经提供了完美答案，但并不是所有类UNIX系统中的readlink都来自coreutils，

更加通用的办法在stackoverflow上也提供了多如牛毛的答案，

但是我觉得其中不少答案或多或少存在一些问题，有的不能追踪多级软链接，有的实现太长不方便简单快捷的放在脚本里，有的无法应对一些特殊的路径情况。

于是我也想出了一个稳健的(自认为)的实现方法：

```bash	
#!/bin/bash
 
shopt -s extglob
 
selfpath=$0
selfdir=${selfpath%%+([!/])}
 
while [[ -L "$selfpath" ]];do
  selfpath=$(readlink "$selfpath")
  if [[ ! "$selfpath" =~ ^/ ]];then
    selfpath=${selfdir}${selfpath}
  fi
  selfdir=${selfpath%%+([!/])}
done
```
利用extglob解决原的变量替换方法会在一些特殊情况下不能正常处理，不用cd式的处理方法，想要实现方法简短，readlink基本是避免不了，但是不用选项，使之完全通用。

这个我也贴在stackoverflow上了
