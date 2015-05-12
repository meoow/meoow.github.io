Title: 如何不“安装”Flash程序来“安装”Flash插件
Date: 2014-06-16 21:02
Modified: 
Category: Article
Tags: OS X,Flash
Authors: meoow
Summary: 

sh的问题，毕竟终归有些时候还是不得不用到。

这里要说的是，我不喜欢Adobe的Flash安装程序总是捆绑一些没用的自动更新和设置程序，我只是想安装那个播放插件就可以了。

如果有人也希望这样的话可以往下看：

首先双击挂载安装程序的dmg，

把“/Volumes/Flash Player/Install Adobe Flash Player.app/Contents/Resources/Adobe Flash Player.pkg”

这个实际的安装包文件拷贝到一个临时目录下，在该目录打开终端运行如下命令：

```sh	
xar -xf Adobe\ Flash\ Player.pkg
gzip -cd < AdobeFlashPlayerComponent.pkg/Payload |cpio -i
gzip -cd < AdobeFlashPlayerComponent.pkg/Scripts |cpio -i./finalize .
sudo cp -r Library/Internet\ Plug-Ins/* /Library/Internet\ Plug-Ins/
```

最后把该目录解压出来剩余的没用的文件删掉即可。

