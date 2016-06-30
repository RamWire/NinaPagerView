# NinaPagerView 
[![Language](https://img.shields.io/badge/Language-%20Objective--C%20-orange.svg)](https://img.shields.io/badge/Language-%20Objective--C%20-orange.svg)
[![Pod Version](http://img.shields.io/cocoapods/v/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Pod Platform](http://img.shields.io/cocoapods/p/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Pod License](http://img.shields.io/cocoapods/l/NinaPagerView.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)

* 一行代码搞定顶部菜单栏。类似网易新闻、今日头条、虎扑看球等app做的一个顶部菜单栏，每栏中有独立的控制器，可自己定制。

## 特点
- [x] 低耦合，您只需创建自己的ViewController即可，后续的操作都在自己的ViewController中。
- [x] 可分步加载您所添加的ViewController，实现类似网易新闻，虎扑看球的效果。
- [x] 只需一行代码创建即可实现所有功能。
- [x] 菜单栏中选中未选中的颜色可自己定制。
- [x] 不仅仅是UIViewController，您可以根据您的需求创建UIView添加到NinaPagerView中。
- [x] 可根据您的需求对上方的滑块进行选择，无论是背景颜色还是文字颜色。

## 预览

![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif1.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif2.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif3.gif)

## 安装

将NinaPagerView文件夹拖入Xcode工程中
您也可以使用Cocoapods或者Carthage集成到工程中

#### 使用 [CocoaPods](http://cocoapods.org/)

在您的podfile中加入`pod 'NinaPagerView'` 然后运行`pod install`。

```
pod 'NinaPagerView'
```

#### 使用 [Carthage](https://github.com/Carthage/Carthage)
在Cartfile中加入下方代码：
```
github "RamWire/NinaPagerView"
```

## 使用
您需要将'**NinaPagerView.h**'(**CocoaPods**) or <**NinaPagerViewCarthage/NinaPagerViewCarthage.h**>(**Carthage**) 加入到您的工程中，然后执行下列代码:
```objc
NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithNinaPagerStyle:NinaPagerStyleSlideBlock WithTitles:titleArray WithVCs:vcsArray WithColorArrays:colorArray];
[self.view addSubview:ninaPagerView];
```
即可完成~

### 其他设置和提示
* 在配置**NinaPagerView**所需的三个数组时，您可以参照下方的代码进行配置(具体说明请看Example中的注释)。
```objc
NSArray *titleArray = @[
                        @"大连市",
                        @"甘井子",
                        @"星海广场",
                        @"西岗",
                        @"马栏子",
                        @"革镇堡",
                        @"中山",
                        @"人民广场",
                        @"中山广场"
                      ];
NSArray *vcsArray = @[
                      @"FirstViewController",
                      @"SecondViewController",
                      @"ThirdViewController",
                      @"ForthViewController",
                      @"FifthViewController",
                      @"SixthViewController",
                      @"SeventhViewController",
                      @"EighthViewController",
                      @"NinthViewController",
                    ];
NSArray *colorArray = @[
                        [UIColor brownColor], /**< 选中的标题颜色 **/
                        [UIColor grayColor], /**< 未选中的标题颜色 **/
                        [UIColor redColor], /**< 下划线颜色或滑块颜色 **/
                        [UIColor whiteColor], /**<  上方菜单栏的背景颜色 **/
                       ];
```
* 如果您在配置NinaPagerView时出现TopTab被导航栏遮挡的情况(上移情况)，请尝试在您调用NinaPagerView的控制器所在的**导航控制器**中加入:
```objc
self.navigationBar.translucent = NO;
```
* 因为在框架里设置的问题，所以您如果需要在第一个控制器中需要push到二级控制器的话，需要多加上下方的这行代码，并且此行代码需要在**addSubView的后面**，具体请看Example中的实现。<br />
```objc
ninaPagerView.pushEnabled = YES;
```

### 版本更新说明
**1.0.0**:1.0.0微调了部分代码同时带来了一些变化，希望您能喜欢:)<br />
**(1)** 又增加了一种NinaPagerStyle:**NinaPagerStyleStateNormal**，是不包含下划线或滑块的样式，如果您的项目有此方面需求，可以选择。<br />
**(2)** Example的数组创建进行调整，更加明了。<br />
**(3)** 上方TopTab高度固定在40，如果您想要进行调整，可以去UIParameter.h设置。<br />
**(4)** 在样式NinaPagerStyleSliderBlock中可以对滑块的圆角进行设置啦，同上您可以去UIParameter.h设置。<br />
**0.9.1**:针对用户需要对上方**toptab**进行自定义，在UIParameter中加入下划线或滑块的长度比和高度设置，灵活度更高。<br />
**0.8.1**:彻底修复了在特定情况下上方**toptab**可以上下滑动的问题。<br />
**0.8**:新版本带来了新效果，您可以对上方的滑块进行类型上的选择，我们为您提供了两种选择，NinaPagerStyleBottomLine和NinaPagerStyleSlideBlock，具体效果参照上方Gif图，您可以下载最新代码进行体验。<br />
**0.7**:修复UITabBarController出现的拖动问题；添加对view数组的支持，您如果觉得viewController数组对于您的项目来说太重并且在呈现界面时不需要这么多Controller进行处理，您可以通过相同的形式将您所想添加的view加入数组中传入NinaPagerView。<br />
**0.6**:添加对长标题的支持，最大可以支持长度为10的汉字。<br />
**0.5.2**:您可以设置titleSize这个属性来设置标题的缩放比例(相对于原比例标题)，推荐您设置的范围在1~1.5之间，如果不设置此属性，默认的缩放比例为1.15。<br />
```objc
ninaPagerView.titleScale = 1.5;
```
**0.5**:适用于**IB创建**或者需要代码实例化创建的VC，如果您有此需求，请传入对应的VC即可(在NinaPagerView的initWithVCs)，具体实现可参照Example中的代码。<br />

### 关于内存管理
* 如果您觉得创建的控制器过多(>5)占用内存过大，可以尝试遵守**<NinaPagerViewDelegate>**代理方法，默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。<br />
```objc
- (BOOL)deallocVCsIfUnnecessary {
  return YES;
}
```

## 反馈
* 如果您在使用的过程中遇到任何问题或者建议，希望您issue我或者发邮件至zhaogengda@126.com，帮助我来完善它。

## Licence

This project uses MIT License.
