# NinaPagerView 
[![Language](https://img.shields.io/badge/Language-%20Objective--C%20-orange.svg)](https://img.shields.io/badge/Language-%20Objective--C%20-orange.svg)
[![Pod Version](http://img.shields.io/cocoapods/v/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Pod Platform](http://img.shields.io/cocoapods/p/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Pod License](http://img.shields.io/cocoapods/l/NinaPagerView.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)

* NinaPagerView is a view easy to page your controllers.
* 一行代码搞定顶部菜单栏。类似网易新闻、今日头条、虎扑看球等app做的一个顶部菜单栏，每栏中有独立的控制器，可自己定制。

## Features
- [x] 低耦合，您只需创建自己的ViewController即可，后续的操作都在自己的ViewController中。
- [x] 可分步加载您所添加的ViewController，实现类似网易新闻，虎扑看球的效果。
- [x] 只需一行代码创建即可实现所有功能。
- [x] 菜单栏中选中未选中的颜色可自己定制。
- [x] 不仅仅是UIViewController，您可以根据您的需求创建UIView添加到NinaPagerView中。
- [x] 可根据您的需求对上方的滑块进行选择，无论是背景颜色还是文字颜色。

## Preview

![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif1.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif2.gif)

## Installation

Drop in the Classes folder to your Xcode project.  
You can also use cocoapods or Carthage.

#### Using [CocoaPods](http://cocoapods.org/)

Add `pod 'NinaPagerView'` to your `Podfile` and run `pod install`.

```
pod 'NinaPagerView'
```

#### Using [Carthage](https://github.com/Carthage/Carthage)
Add the following line to your Cartfile:
```
github "RamWire/NinaPagerView"
```

## Usage
You need add '**NinaPagerView.h**'(**CocoaPods**) or <**NinaPagerViewCarthage/NinaPagerViewCarthage.h**>(**Carthage**) to your project.Then load the codes:
然后执行下列代码:
```objc
NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithNinaPagerStyle:NinaPagerStyleSlideBlock WithTitles:titleArray WithVCs:vcsArray WithColorArrays:colorArray];
[self.view addSubview:ninaPagerView];
```
即可完成~

### Other Settings and Tips
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
                        [UIColor brownColor], /**< 选中的标题颜色 Title SelectColor  **/
                        [UIColor grayColor], /**< 未选中的标题颜色  Title UnselectColor **/
                        [UIColor redColor], /**< 下划线颜色或滑块颜色 Underline or SlideBlock Color   **/
                        [UIColor whiteColor], /**<  上方菜单栏的背景颜色 TopTab Background Color   **/
                       ];
```
* 如果您在配置NinaPagerView时出现TopTab被导航栏遮挡的情况(上移情况)，请尝试在您调用NinaPagerView的控制器所在的**导航控制器**中加入:
```objc
self.navigationBar.translucent = NO;
```
* 因为在框架里设置的问题，所以您如果需要在第一个控制器中需要push到二级控制器的话，需要多加上下方的这行代码，并且此行代码需要在**addSubView的后面**，具体请看Example中的实现。<br />
    Because of the framework setting,you must add following codes under the line after addSubView codes in order to push second level VC. 
```objc
ninaPagerView.pushEnabled = YES;
```

### 版本更新说明
**1.0.0**:1.0.0微调了部分代码同时带来了一些变化，希望您能喜欢:)<br />
1.0.0 improves some codes,meanwhile brings some changes for the framework,wish you like it:)<br />
**(1)** 又增加了一种NinaPagerStyle:NinaPagerStyleStateNormal，是不包含下划线或滑块的样式，如果您的项目有此方面需求，可以选择。<br />
Add a new NinaPagerStyle:NinaPagerStyleStateNormal,it's a style which not has bottomline or sliderblock.You can choose it if needed.<br />
**(2)** Example的数组创建进行调整，更加明了。<br />
Creating Arrays in Example is changed,more clearly!<br />
**(3)** 上方TopTab高度固定在40，如果您想要进行调整，可以去UIParameter.h设置。<br />
TopTab height fasten to 40,if you wanna to change it,please set it in UIParameter.h.<br />
**(4)** 在样式NinaPagerStyleSliderBlock中可以对滑块的圆角进行设置啦，同上您可以去UIParameter.h设置。<br />
In NinaPagerStyleSliderBlock,now you can set block's cornerRadius by setting in UIParameter.h.<br />
**0.9.1**:针对用户需要对上方**toptab**进行自定义，在UIParameter中加入下划线或滑块的长度比和高度设置，灵活度更高。<br />
    Add some parameters to toptab's bottomline or slider,now you can set their width and height to the project.<br />
**0.8.1**:彻底修复了在特定情况下上方**toptab**可以上下滑动的问题。<br />
    Fix topTab vertical-scroll in some conditions.<br />
**0.8**:新版本带来了新效果，您可以对上方的滑块进行类型上的选择，我们为您提供了两种选择，NinaPagerStyleBottomLine和NinaPagerStyleSlideBlock，具体效果参照上方Gif图，您可以下载最新代码进行体验。<br />
    New selection of topTab style,now you can choose NinaPagerStyleBottomLine and NinaPagerStyleSlideBlock as gifs showed.<br />
**0.7**:修复UITabBarController出现的拖动问题；添加对view数组的支持，您如果觉得viewController数组对于您的项目来说太重并且在呈现界面时不需要这么多Controller进行处理，您可以通过相同的形式将您所想添加的view加入数组中传入NinaPagerView。<br />
    If you think vcs is not comfortable for your project, you can use view arrays to built.Just put views into array~<br />
**0.6**:添加对长标题的支持，最大可以支持长度为10的汉字。<br />
    Support long-length title.<br />
**0.5.2**:您可以设置titleSize这个属性来设置标题的缩放比例(相对于原比例标题)，推荐您设置的范围在1~1.5之间，如果不设置此属性，默认的缩放比例为1.15。<br />
    You can set titleSize for title animation(compare to origin title),command range between 1 and 1.5.If don't set this,default scale is 1.15.
```objc
ninaPagerView.titleScale = 1.5;
```
**0.5**:适用于**IB创建**或者需要代码实例化创建的VC，如果您有此需求，请传入对应的VC即可(在NinaPagerView的initWithVCs)，具体实现可参照Example中的代码。<br />
    If you wanna create VCs by **IB** or code by yourself, you can put VCs into array.You can create them like the Example codes.

### 关于内存管理
* 如果您觉得创建的控制器过多(>5)占用内存过大，可以尝试遵守**<NinaPagerViewDelegate>**代理方法，默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。<br />
    If you care the vcs causes huge memory,please try NinaPagerViewDelegate delegate,default is load recent 5 vcs,others will dealloc.If you scroll to the dealloc page, it will load again.If you don't use the delegate,default is NO.
```objc
- (BOOL)deallocVCsIfUnnecessary {
  return YES;
}
```

## FeedBack
* 如果您在使用的过程中遇到任何问题或者建议，希望您issue我或者发邮件至zhaogengda@126.com，帮助我来完善它。
* If you find bugs in this project or any suggestions,hope you can give me feedback by issues or Email me to zhaogengda@126.com.

## Licence

This project uses MIT License.
