# NinaPagerView 
[![Pod Version](http://img.shields.io/cocoapods/v/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Pod Platform](http://img.shields.io/cocoapods/p/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Pod License](http://img.shields.io/cocoapods/l/NinaPagerView.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)

* NinaPagerView is a view easy to page your controllers.
* 一行代码搞定顶部菜单栏。类似网易新闻、虎扑看球等app做的一个顶部菜单栏，每栏中有独立的控制器，可自己定制。

## Features
- [x] 低耦合，您只需创建自己的ViewController即可，后续的操作都在自己的ViewController中
- [x] 可分步加载您所添加的ViewController，实现类似网易新闻，虎扑看球的效果。
- [x] 只需一行代码创建即可实现所有功能。
- [x] 菜单栏中选中未选中的颜色可自己定制

## Preview
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif1.gif)

## Installation

Drop in the Classes folder to your Xcode project.  
You can also use cocoapods or Carthage.

#### Using [cocoapods](http://cocoapods.org/)

Add `pod 'NinaPagerView'` to your `Podfile` and run `pod install`.

```
pod 'NinaPagerView'
```

#### Using Carthage
Add the following line to your Cartfile:
```
github "RamWire/NinaPagerView"
```

## Usage
You need add '**NinaPagerView.h**'(**CocoaPods**) or <**NinaPagerViewCarthage/NinaPagerViewCarthage.h**>(**Carthage**) to your project.Then load the codes:
然后执行下列代码:
```objc
/**< 创建ninaPagerView，控制器第一次是根据您划的位置进行相应的添加的，类似网易新闻虎扑看球等的效果，后面再滑动到相应位置时不再重新添加，如果想刷新数据，您可以在相应的控制器里加入刷新功能，低耦合。需要注意的是，在创建您的控制器时，设置的frame为FUll_CONTENT_HEIGHT，即全屏高减去导航栏高度再减去Tabbar的高度，如果这个高度不是您想要的，您可以去UIParameter.h中进行设置。
A tip you should know is that when init the VCs frames,the default frame i set is FUll_CONTENT_HEIGHT,it means fullscreen height - NavigationHeight - TabbarHeight.If the frame is not what you want,just go to UIParameter.h to change it!XD**/
NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithTitles:titleArray WithVCs:vcsArray WithColorArrays:colorArray];
[self.view addSubview:ninaPagerView];
```
即可完成~

### Other Settings and Tips
* 在配置**NinaPagerView**所需的三个数组时，您可以参照下方的代码进行配置。
```objc
//Need You Edit
/**<  上方显示标题  Titles showing on the topTab   **/
NSArray *titleArray =   @[
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
/**< 每个标题下对应的控制器，只需将您创建的控制器类名加入下列数组即可(注意:数量应与上方的titles数量保持一致，若少于titles数量，下方会打印您缺少相应的控制器，同时默认设置的最大控制器数量为10)  。
ViewControllers to the titles on the topTab.Just add your VCs' Class Name to the array. Wanning:the number of ViewControllers should equal to the titles.Meanwhile,default max VC number is 10.
**/
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
/**< 您可以选择是否要改变标题选中的颜色(默认为黑色)、未选中的颜色(默认为灰色)或者下划线的颜色(默认为色值是ff6262)。如果传入颜色数量不够，则按顺序给相应的部分添加颜色。
You can choose whether change your titles' selectColor(default is black),unselectColor(default is gray) and underline color(default is Color value ff6262).**/
NSArray *colorArray = @[
                        [UIColor brownColor], /**< 选中的标题颜色 Title SelectColor  **/
                        [UIColor grayColor], /**< 未选中的标题颜色  Title UnselectColor **/
                        [UIColor redColor], /**< 下划线颜色 Underline Color   **/
                        [UIColor whiteColor], /**<  上方菜单栏的背景颜色 TopTab Background Color   **/
                       ];
```
* **version 0.5** 添加:适用于**IB创建**或者需要代码实例化创建的VC，如果您有此需求，请传入对应的VC即可(在NinaPagerView的initWithVCs)，具体实现可参照Example中的代码。<br />
    If you wanna create VCs by **IB** or code by yourself, you can put VCs into array.You can create them like the Example codes.
* **version 0.5.2**添加:您可以设置titleSize这个属性来设置标题的缩放比例(相对于原比例标题)，推荐您设置的范围在1~1.5之间，如果不设置此属性，默认的缩放比例为1.15。<br />
    You can set titleSize for title animation(compare to origin title),command range between 1 and 1.5.If don't set this,default scale is 1.15.
```objc
ninaPagerView.titleScale = 1.5;
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

### 关于内存管理
* 如果您觉得创建的控制器过多(>5)占用内存过大，可以尝试遵守**<NinaPagerViewDelegate>**代理方法，默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。<br />
    If you care the vcs causes huge memory,please try NinaPagerViewDelegate delegate,default is load recent 5 vcs,others will dealloc.If you scroll to the dealloc page, it will load again.If you don't use the delegate,default is NO.
```objc
/**<  Add <NinaPagerViewDelegate> to the ViewController and add codes(you can get more details in example)   **/
- (BOOL)deallocVCsIfUnnecessary {
  return YES;
}
```

## FeedBack
* 如果您在使用的过程中遇到任何问题或者建议，希望您issue我，帮助我来完善它。
* If you find bugs in this project or any suggestions,hope you can give me feedback by issues.

## Licence

This project uses MIT License.
