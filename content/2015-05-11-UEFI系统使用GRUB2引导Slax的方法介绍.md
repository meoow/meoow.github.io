Title: UEFI系统使用GRUB2引导Slax的方法介绍
Date: 2014-06-16 22:34
Modified: 
Category: Article
Tags: uefi,grub2,slax,linux
Authors: meoow
Summary: 

尽管我在Slax吧已经发过了，不过还是在这里再发一遍。

对于MSDOS（MBR）分区表的移动硬盘，我向来喜欢用GRUB4DOS来引导各种系统，
不过连最落后的Windows也都早已支持安装在GPT分区表的硬盘了，所以我就像介绍一下UEFI系统下使用GPT分区表的硬盘/U盘引导Slax之类的系统的方法
引导里面我用的比较熟的也就是GRUB2和GRUB4DOS了，不过既然GRUB4DOS不支持GPT，那重任就落在GRUB2身上了。
GRUB2 远远比GRUB4DOS强大，所以GRUB2也不是一个简单的引导文件就可以了，而是包含大量模块文件，大体的结构就是grub2的efi引导文件在 ESP分区的EFI/boot目录下，而模块文件在标准的/boot/grub/下，并不一定引导文件在同一分区。
这样散乱的方式对于非Linux系统下可能不方便管理，容易误删，所以我这里介绍一下另一种方法----单文件引导。
Grub2提供了这样一个功能，也就是把所有引导相关的文件全打包到一个efi文件里，好像intel的efi shell，这样使用更方便了，把引导迁移到别的硬盘，只要拷贝这一个文件就可以了。
```sh
# 产生一个供grub2的单文件使用的“伪”配置文件，
# 在开机引导时用来加载真正的外部配置文件
echo 'configfile ${cmdpath}/grub.cfg' > grub.cfg

# 使用grub2包里的单文件制作工具
	
grub-mkstandalone -d /usr/lib/grub/x86_64-efi/ -O x86_64-efi --modules="part_gpt part_msdos" --fonts="unicode" --locales="en@quot" --themes="" -o "bootx64.efi" "/boot/grub/grub.cfg=./grub.cfg" -v

 输出镜像文件的格式
# —modules 预加载的模块，用来识别GPT和MBR分区表，以便能够加载外部配置文件
# —fonts 提供unicode支持
# —locales 这里是使用英语，中文可以用zh_CN
# -o 输出文件名称
```
```sh
# 最后建立一个名为grub.cfg的文件（不同于之前的伪grub.cfg文件）
# 以引导Slax为例，输入如下内容
```
	
```grub
set default=0
set timeout=-1
 
insmod gfxterm
insmod vbe
 
terminal_output gfxterm
 
menuentry "Slax (Desktop)" {
           insmod ext2
           search--no-floppy --fs-uuid --set=root 4255053d-1d2a-4c33-bab9-71d25d00f548
           linux /SLAX7/boot/vmlinuz from=/SLAX7/ load_ramdisk=1 prompt_ramdisk=0 rwprintk.time=0 slax.flags=perch,xmode
           initrd /SLAX7/boot/initrfs.img
}

# slax的存储路径根据自己情况修改（我这里是SLAX7）
# search uuid那里根据自己的slax存放分区修改，使用blkid可以查看所在分区的uuid
# 如果放在fat32分区，uuid是XXXX-XXXX这样，且不需要前面的insmod ext2那行
# 内核参数里vga=normal在GRUB2已经deprecated了，可以拿掉。

```

otx64.efi和建立的grub.cfg都拷贝到GPT分区硬盘的ESP分区的/EFI/boot目录下，或者MBR分区硬盘的第一个FAT32分区的/EFI/boot下。
开机启动菜单选择对应的EFI启动项即可了。

