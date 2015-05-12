Title: 挂载MTP的android设备的工具----go-mptfs
Date: 2014-06-11 21:24
Modified: 
Category: Article
Tags: android,mtp,go
Authors: meoow
Summary: 

在Linux下，不能原生挂载MTP设备，OSX下的Android File Transfer也是BUG成堆。
基于libmtp的mtpfs或基于adb的adbfs利用fuse挂载，性能很差还不稳定。

无意间发现了个霸道的项目
https://github.com/hanwen/go-mtpfs
用Go实现的mtpfs，使用了感觉性能很好，可以满足了。
作者应该是只为Linux开发的，不过我试验了，在OSX下用homebrew安装了libusb和osxfuse以后，也可以编译通过和正常使用，不过貌似性能没有Linux下好？也许是fuse的问题？
