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
- [x] 低耦合，您只需创建视图或控制器即可。
- [x] 可分步加载您所添加的视图，实现类似网易新闻，虎扑看球的效果。
- [x] 只需一行代码创建即可实现所有功能。
- [x] 菜单栏可随需求自己定制，不仅仅局限于标题样式。
- [x] 支持storyboard。
- [x] 可根据您的需求对上方的滑块进行选择，无论是背景颜色还是文字颜色。
- [x] 像今日头条、网易新闻一样进行标题和内容的动态添加和删除。

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
NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithObjects:objects];
[self.view addSubview:ninaPagerView];
```
即可完成~

### 其他设置和补充
* 庞大的**自定义属性**您可以在NinaPagerView中设置。
* NinaPagerView支持**顶部菜单栏自定义配置**，创建自己想要的样式，加入到NinaPagerView中吧(具体说明配置请看Example中的注释)。
* 在配置**NinaPagerView**所需的两个数组时，您可以参照下方的代码进行配置(具体说明请看Example中的注释)。
```objc
NSArray *titles = @[
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
NSArray *objects = @[
                      @"FirstView",
                      @"SecondView",
                      @"ThirdView",
                      @"ForthView",
                      @"FifthView",
                      @"SixthView",
                      @"SeventhView",
                      @"EighthView",
                      @"NinthView",
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
* 如果使用的是控制器数组，并且控制器里需要添加视图，建议您在viewWillLayoutSubviews中进行addSubview操作，在viewDidLoad方法里并不奏效，具体请看demo中的代码。

### NinaPagerViewDelegate
#### 关于内存管理
* 如果您觉得创建的控制器过多(>5)占用内存过大，请使用NinaPagerViewDelegate。默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。<br />
```objc
- (BOOL)deallocVCsIfUnnecessary {
  return YES;
}
```
#### 关于获取到当前显示的界面
* 由于子控制器的限制，您无法捕捉到对应的控制器的ViewWillAppear等生命周期里关于appear的方法，为了达到相同的功能，您可以通过此代理方法来获取到当前页码、当前对象及上一个对象进而对相关的控制器进行操作。
```objc
- (void)ninaCurrentPageIndex:(NSInteger)currentPage currentObject:(id)currentObject lastObject:(id)lastObject {
  NSLog(@"Current page is %li",currentPage);
}
```
## Licence

This project uses MIT License.
