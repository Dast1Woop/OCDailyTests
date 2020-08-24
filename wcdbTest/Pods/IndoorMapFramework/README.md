# IndoorMapFramework

[![CI Status](https://img.shields.io/travis/641540230@qq.com/IndoorMapFramework.svg?style=flat)](https://travis-ci.org/641540230@qq.com/IndoorMapFramework)
[![Version](https://img.shields.io/cocoapods/v/IndoorMapFramework.svg?style=flat)](https://cocoapods.org/pods/IndoorMapFramework)
[![License](https://img.shields.io/cocoapods/l/IndoorMapFramework.svg?style=flat)](https://cocoapods.org/pods/IndoorMapFramework)
[![Platform](https://img.shields.io/cocoapods/p/IndoorMapFramework.svg?style=flat)](https://cocoapods.org/pods/IndoorMapFramework)


# 说明

## 示例
要运行示例项目，请克隆repo，然后首先从Example目录运行`pod install`。

## 支持
* 本SDK支持竖屏iPhone或iPad；
* 最低支持版本为 iOS**10.0**；

# 使用
## 工程设置

### Build Settings配置
在TARGETS-Build Settings-Other Linker Flags中添加如下内容：-ObjC;如果已经存在，就无需再添加了。

### info.plist配置
在info.plist中添加如下设置(NSAllowsArbitraryLoads是为了使APP可以访问http协议接口)：

```swift
<key>MGLMapboxMetricsEnabledSettingShownInApp</key>
<true/>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>APP需要使用定位权限进行GPS定位</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>APP需要使用定位权限进行GPS定位</string>
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
```

## 代码设置
### Podfile配置
* Podfile中添加库
```swift
pod 'IndoorMapFramework'
```
* 执行 **pod update** 进行更新

### 代码引用
在需要使用地图的类中，导入下面头文件即可：
`#import <IndoorMapFramework/IndoorMapFramework.h>`

## 更新说明 
请参考 https://github.com/JyyJDast1/MapSDK/releases 相关tag对应注释

## 执照

IndoorMapFramework在MIT许可下可用。 有关详细信息，请参阅LICENSE文件。
