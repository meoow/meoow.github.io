Title: Thunderbird使用Gmail需要用到的FoxyProxy规则
Date: 2015-06-02 20:48
Modified: 
Category: Article
Tags: 
Authors: meoow
Summary: 

Thunderbird使用FoxyProxy时，因为只是连接邮件服务器即可，所以并不需要像Firefox一样，更新一个很长的GƒW列表。更准确的说只要把Gmail的情况匹配即可。

经过的我试验调整，暂时只用如下三条规则即可正常使用Gmail：
```
^https?://([a-z0-9-_]+\.)?g(oogle(mail|code|usercontent|apis|syndication|-analytics)?|static|mail)\.(com(\.[a-z]{2})?|cn)(/.*)?$

^imap://imap.googlemail.com:\d+(/.*)?$

^mailto://[^/@]+@smtp.googlemail.com:\d+(/.*)?$
```
第一个是匹配Google的各种服务，第二个是收邮件用，第三个是发邮件用。
