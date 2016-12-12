### 钉钉抢红包非越狱版

##### 1、从 **APPStore** 商店下载安装的APP 默认都被苹果加了一层壳，加了壳后我们就无法使用dump导出头文件等其它操作，需要砸壳后的微信ipa：[iOS逆向工程之Clutch砸壳](http://www.jianshu.com/p/4cfd86600ced)

##### 2、编写钉钉抢红包的代码(这里就是此工程) 

**2.1**  cd 到 `build_dylib.sh` 目录下， 运行脚本 `build_dylib.sh` 就可以生成用来嵌入微信二进制的通用的动态链接库 `TestTweak.dylib` 

**2.2** 解压微信ipa，将 `TestTweak.dylib` 拷贝其到微信的二进制包中

**2.3** 安装 [optool](https://github.com/alexzielenski/optool) ，这个项目包含了另外的子项目，[ArgumentParser](https://github.com/mysteriouspants/ArgumentParser.git)，ArgumentParser又包含子项目 [CoreParse](https://github.com/beelsebob/CoreParse.git)，记得修改ArgumentParser中CoreParse的代码地址（ArgumentParser配置的有问题）

**2.4** 修改微信二进制,使其能够加载我们的动态库,这一步需要使用[optool](https://github.com/alexzielenski/optool)来实现 

```shell
optool install -c load -p "@executable_path/TestTweak.dylib" -t Payload/WeChat.app/WeChat
```

 （记得 `@executable_path` 不能缺少）

**2.5** 接下来把我们生成的 `TestTweak.dylib` 、刚刚注入dylib的WeChat、以及 `embedded.mobileprovision` 文件(可以在之前打包过的App中找到)拷贝到WeChat.app中
一定要记得 需要这个 `embedded.mobileprovision` 文件,如果没有这个文件,重签名后是安装不了的

**2.6** 重签名 这一步可以使用图形化工具 [ios-app-signer源码](https://github.com/DanTheMan827/ios-app-signer)   [ios-app-signer下载](http://dantheman827.github.io/ios-app-signer/)  得到新的ipa安装包

**2.7** 安装ipa包即可。

