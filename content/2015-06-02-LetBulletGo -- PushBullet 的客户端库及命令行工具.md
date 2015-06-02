Title: LetBulletGo -- PushBullet 的客户端库及命令行工具
Date: 2014-11-28 21:19
Modified: 
Category: Article
Tags: 
Authors: meoow
Summary: 
PushBullet (https://www.pushbullet.com/) 是个很不错的工具，支持在自己的不同设备之间推送信息，

移动设备上Android和iOS都支持，桌面端几乎所有主流浏览器都有扩展提供，例如在手机上可以直接给自己的浏览器发一条信息，浏览器就会弹出通知。

虽然PushBullet没有原生客户端，不过好在其开放了API，所以完全可以自己写客户端，虽然网上已经有多人用不同的语言实现了这个库，不过倒也不妨碍我试图想造个更好的轮子。


LetBulletGo

https://github.com/meoow/LetBulletGo

用法直接去看readme即可。功能上已经可以满足使用了，不过还会在继续改进。

另外，推送文件功能，由于PushBullet使用亚马逊AWS空间，所以若是出现推送失败也不要奇怪。
