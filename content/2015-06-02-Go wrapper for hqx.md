Title: Go wrapper for hqx
Date: 2015-02-23 20:56
Modified: 
Category: Article
Tags: 
Authors: meoow
Summary: 

因为手欠，把OSX系统的所有@2x分辨率的图片都删了，并软链接到1倍大的图片，因为以为我的air屏幕既然不是retina的，自然留着2倍的图片没有用。

结果删完发现，很多应用程序的界面显示不正常了，想不到不是retina屏幕系统竟然也用2倍分辨率的图片显示界面。


于是只好批量把1倍的图片批量放大还原回去，用ffmpeg就能搞定，不过就算使用效果比较好的滤镜如lanczos，显示还是有些模糊，

网上搜了一下发现这类界面图片用HQx算法放大效果最好，

HQx滤镜其实在模拟器上见得最多，的确是效果非常好的放大滤镜，

我找到了个C的实现，不过编译需要devil库支持命令行，这个库clang死活编译不过去，只能gcc，

于是我研究了下hqx的源码，用Go做了个包装，用起来就方便多了


[源码地址](https://github.com/meoow/hqx)
