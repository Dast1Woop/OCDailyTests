# 协作开发规范
## 开发语言
最好只使用OC语言编程：本SDK纯OC语言开发，api文档提取比较方便，目前OC与swift混编在打包成SDK时不方便（api文档提取、权限声明等问题），因此建议只用OC编程。

## 适配
* 本SDK支持竖屏iPhone或iPad；
* 最低支持版本为 iOS**10.0**；

## 目录创建
为方便区分上海团队在本SDK基础之上做了哪些新增功能，建议创建新文件时，最好都放在下面项目文件夹下：
```swift
IndoorMapFramework/IndoorMapFramework/TJNewCode
```

## 代码说明
不同 scheme含义：
* IndoorMapDemo：关联了IndoorMapFramework的demo，运行可查看demo效果
* IndoorMapFramework：地图SDK，debug模式对应debug接口，release模式对应release接口。debug模式下：当代码中指定IS_USE_BETA_4_COCOPODS为1时，代表beta接口。
* HTMapBundle：地图SDK对应图片和xib、storyboard等素材，能切只能存到这里。注意调用方法与普通方式不同。
* IndoorMapDemo-Beta：对应地图beta环境demo
* IndoorMapFramework-Beta：仅用于调试，不能用于生成SDK。对应地图beta环境
* 遇到‘/HTMapBundle.bundle: No such file or directory’错误时，选择HTMapBundle.bundle scheme编译一次，再切回其他scheme编译即可

## 代码规范
* .h头文件中的属性和方法都需要注释。按 cmd+option+/ 进行注释，方便api文档提取时对注释自动提取。
* 类创建时以HTM开头，防止与其他库文件名冲突
* 创建Category时，在category命名时加上前缀，防止与其他sdk命名冲突。如命名为：HTMRoutePath+TJCategory
* 在生成SDK时，只能使用IndoorMapFramework scheme进行编译。切到IndoorMapFramework scheme，然后选择真机编译一次，再选择模拟器编译一次。此时会自动弹出Product文件夹，里面的SDK已经支持真机和模拟器了。

## 第三方库引用
如需引用第三方库，请使用 cocoapods 方式进行引用。防止外部调用SDK时出现符号表冲突问题。
即：在Podfile文件中添加引用：
```swift
abstract_target 'Shows' do
#4.11.0:模型无法渲染；5.0+，路径图层被盖住
pod 'Mapbox-iOS-SDK','~>4.10.0'
pod 'AFNetworking','~>3.2.1'
pod ‘Masonry','~>1.1.0'

#在本行下添加新引用的第三方库

target 'IndoorMapDemo' do
...
```
