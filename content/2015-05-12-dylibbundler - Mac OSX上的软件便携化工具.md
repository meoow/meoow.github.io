Title: dylibbundler - Mac OSX上的软件便携化工具
Date: 2014-06-16 21:20
Modified: 
Category: Article
Tags: OS X
Authors: meoow
Summary: 

例如，PSP模拟器PPSSPP的OSX版本在官方网站上提供了预编译的版本，但是它依赖SDL库需要自己提供，是用otool -L可以发现其所依赖的sdl库是用绝对路径写死了位置的也就是说必须是homebrew安装的版本，而不是rpath让系统找framework。
但是事实上完全是可以通过一定的“hack”手段把sdl库集成到app bundle中再发布，这样就连sdl库都省得自己安装了。
手动的办法就是将sdl的dylib文件拷贝到PPSSPP执行文件的统一目录下，然后用install_name_tool来修改PPSSPP加载SDL库的查询路径。例如
```
install_name_tool -change /usr/local/lib/libsdl.dylib @executable_path/libsdl.dylib PPSSPP
```
这里的路径是我编的，要看实际情况修改。效果就是查询加载sdl库的位置有原来的/usr/local/lib/改到了@executable_path，而这个@executable_path就是执行程序的所在路径。
@executable_path的特点是始终是用执行程序的路径
例如这样的关系
> executable_bin -> A.dylib -> B.dylib

那么在A.dylib或B.dylib中是用@executable_path的话，始终是executable_bin的路径，而跟A.dylib或B.dylib的实际路径没有关系。
而像Linux的执行文件或so的RPATH则始终是该文件自己的路径。


这里大家应该想到了，手动修改的话如果依赖关系十分简单到还可以，如果依赖很多dylib，并且dylib还继续依赖dylib的话，就比较麻烦了。  
dylibbundler就是解决这个问题的，它会根据执行文件的依赖关系将所有dylib拷贝到你指定了路径，并相应的修改库的查询位置，而且套圆环的关系也一并处理。并且会省略系统自带的库。