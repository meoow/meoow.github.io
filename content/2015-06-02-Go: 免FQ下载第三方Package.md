Title: Go: 免FQ下载第三方Package
Date: 2015-02-04 21:06
Modified: 
Category: Article
Tags: Go
Authors: meoow
Summary: 
遇到依赖 golang/x/ 或 code.google.com/p/ 下托管代码的包下载不下来是一件很闹心的事情，原因你当然知道。

好在http://gopm.io/这里提供了\代\理下载这些包的功能，省去了FQ的麻烦。

虽然没了.git之类的版本控制信息，但是好在能下载下来也就别要什么自行车了。

不过，懒癌晚期的我觉得连打开gopm.io页面，填上包名，点击下载按钮都觉得是麻烦的事，

于是写了个bash函数直接从命令行下载

```bash
gopmget() {
  if [[ -z "$1" ]];then
    return 1
  fi
  curl -sL 'http://gopm.io/download' \
    -H 'Host: gopm.io' \
    -H 'Referer: http://gopm.io/download?pkgname='"$1" \
    --data-urlencode 'pkgname='"$1" --data 'revision=' > "${1##*/}.zip"
}
```

使用例子：

```bash
gopmget golang.org/x/tools
```

然后把tools.zip文件解压到$GOPATH/src/golang.org/x/，然后重命名文件夹即可。
