![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/Slice1.png)
[![Language](https://img.shields.io/badge/Language-%20Objective--C%20-orange.svg)](https://img.shields.io/badge/Language-%20Objective--C%20-orange.svg)
[![Build Status](https://travis-ci.org/RamWire/NinaPagerView.svg?branch=master)](https://travis-ci.org/RamWire/NinaPagerView)
[![Pod Version](http://img.shields.io/cocoapods/v/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Pod Platform](http://img.shields.io/cocoapods/p/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![Pod License](http://img.shields.io/cocoapods/l/NinaPagerView.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)

* 一行代码搞定顶部菜单栏。类似网易新闻、今日头条、虎扑看球等app做的一个顶部菜单栏，每栏中有独立的控制器，可自己定制。

## 特点
- [x] 低耦合，您只需创建自己的ViewController即可，后续的操作都在自己的ViewController中。
- [x] 可分步加载您所添加的ViewController，实现类似网易新闻，虎扑看球的效果。
- [x] 只需一行代码创建即可实现所有功能。
- [x] 菜单栏可随需求自己定制，不仅仅局限于标题样式。
- [x] 不仅仅是UIViewController，您可以根据您的需求创建UIView添加到NinaPagerView中。
- [x] 可根据您的需求对上方的滑块进行选择，无论是背景颜色还是文字颜色。

## 预览

![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif1.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif2.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif3.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif4.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif5.gif)

## 安装

将NinaPagerView文件夹拖入Xcode工程中
您也可以使用Cocoapods或者Carthage集成到您的工程中

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
NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithVCs:vcsArray];
[self.view addSubview:ninaPagerView];
```
即可完成~

### 其他设置和补充
* 庞大的**自定义属性**您可以在NinaPagerView中设置🍻🍻🍻。
* NinaPagerView支持**顶部菜单栏自定义配置**，创建自己想要的样式，加入到NinaPagerView中吧(具体说明配置请看Example中的注释)。
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
```
* 如果您将导航栏隐藏或者没有导航栏，您需要设置**nina_navigationBarHidden**为YES。<br />
```objc
ninaPagerView.nina_navigationBarHidden = YES;
```
* 您可以自定义设置的控制器或视图最多为**10**，如果您想创建更多，可以对NinaPagerView中的**MaxNums**进行设置。
* 如果您需要push到包含NinaPagerView的控制器，请确保**前一级**控制器导航栏的**translucent**为**NO**，如果没有，您可以按照如下代码进行设置:
```objc
self.navigationController.navigationBar.translucent = NO;
```

### NinaPagerViewDelegate
#### 关于内存管理
* 如果您觉得创建的控制器过多(>5)占用内存过大，可以尝试遵守**<NinaPagerViewDelegate>**代理方法，默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。<br />
```objc
- (BOOL)deallocVCsIfUnnecessary {
  return YES;
}
```
#### 关于获取到当前显示的界面
* 通过此代理方法您可以获取到当前页码进而对相关的控制器进行操作。
```objc
- (void)ninaCurrentPageIndex:(NSString *)currentPage {
  NSLog(@"Current page is %@",currentPage);
}
```

### 版本更新说明
#### v1.5.3
新增滑动隐藏菜单栏属性。 <br />
#### v1.5.1
新增了自定义顶部菜单栏，现在您可以定制您自己的菜单栏！ <br />
#### v1.4.8
新增控制下方视图左右的属性nina_scrollEnabled和根据当前标题自动计算下划线宽度的属性nina_autoBottomLineEnable，同时继续尝试修复KVO引起的小概率crash问题。 <br />
#### v1.4.6
修复可能引起整体View坐标出错的问题。 <br />
#### v1.4.5
修复一个可能引起scrollsToTop冲突的问题。 <br />
#### v1.4.3
新添加了标题选中未选中等设置颜色的属性，您现在不需要再在init方法中设置它们的颜色了。 <br />
#### v1.4.2
新添加了设置topTab高度、标题字体大小的属性，同时您现在可以对topTab下方的总览线进行隐藏设置了。 <br />
#### v1.4.1
修复了上一版本出现的一些小错误，同时您现在不需要手动再对navigationController.navigationBar.translucent设置成NO了，NinaPagerView会在内部对此进行处理。 <br />
#### v1.4.0
将设置默认加载界面等宏定义更改为NinaPagerView的属性，方便在项目中复用，自定义更加灵活。 <br />
#### v1.3.0
在UIParameter.h中新添加NinaDefaultPageIndex，您可以通过设置它来设置默认加载的页面，具体说明请看框架中的说明。 <br />
#### v1.2.0
新增一次性加载所有界面模式(可以在UIParameter.h的LoadWholePage中进行设置)。<br />
获取到当前显示界面的代理方法，方便在根控制器中进行数据等操作。<br />
#### v1.1.2
修复了在滑块模式下的长标题显示稍微不对称的问题同时优化滑块模式细节。<br />
#### v1.1.1
修复了在滑块模式下的长标题显示不全问题。<br />
#### v1.1.0
加入了对导航栏隐藏情况的支持，您现在可以选择切换有无导航栏两种情况。<br />
#### v1.0.0
1.0.0微调了部分代码同时带来了一些变化，希望您能喜欢:)<br />
**(1)** 又增加了一种NinaPagerStyle:**NinaPagerStyleStateNormal**，是不包含下划线或滑块的样式，如果您的项目有此方面需求，可以选择。<br />
**(2)** Example的数组创建进行调整，更加明了。<br />
**(3)** 上方TopTab高度固定在40，如果您想要进行调整，可以去UIParameter.h设置。<br />
**(4)** 在样式NinaPagerStyleSliderBlock中可以对滑块的圆角进行设置啦，同上您可以去UIParameter.h设置。<br />
#### v0.9.1
针对用户需要对上方**toptab**进行自定义，在UIParameter中加入下划线或滑块的长度比和高度设置，灵活度更高。<br />
#### v0.8.1
彻底修复了在特定情况下上方**toptab**可以上下滑动的问题。<br />
#### v0.8
新版本带来了新效果，您可以对上方的滑块进行类型上的选择，我们为您提供了两种选择，**NinaPagerStyleBottomLine**和**NinaPagerStyleSlideBlock**，具体效果参照上方Gif图，您可以下载最新代码进行体验。<br />
#### v0.7
修复UITabBarController出现的拖动问题；添加对view数组的支持，您如果觉得viewController数组对于您的项目来说太重并且在呈现界面时不需要这么多Controller进行处理，您可以通过相同的形式将您所想添加的view加入数组中传入NinaPagerView。<br />
#### v0.6
添加对长标题的支持，最大可以支持长度为10的汉字。<br />
#### v0.5.2
您可以设置titleSize这个属性来设置标题的缩放比例(相对于原比例标题)，推荐您设置的范围在1~1.5之间，如果不设置此属性，默认的缩放比例为1.15。<br />
```objc
ninaPagerView.titleScale = 1.5;
```
#### v0.5
适用于**IB创建**或者需要代码实例化创建的VC，如果您有此需求，请传入对应的VC即可(在NinaPagerView的initWithVCs)，具体实现可参照Example中的代码。<br />

## 反馈
* 如果您在使用的过程中遇到任何问题或者建议，希望您issue我或者发邮件至zhaogengda@126.com，帮助我来完善它。

## Licence

This project uses MIT License.
