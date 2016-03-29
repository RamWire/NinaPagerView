<<<<<<< HEAD
# NinaPagerView 
[![Pod Version](http://img.shields.io/cocoapods/v/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
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
You can also use cocoapods.

#### Using [cocoapods](http://cocoapods.org/)

Add `pod 'NinaPagerView'` to your `Podfile` and run `pod install`.

```
pod 'NinaPagerView','~> 0.2' 
```

## Usage
You need add '**NinaPagerView.h**' to your project.Then load the codes:
然后执行下列代码:
```objc
/**< 创建ninaPagerView，控制器第一次是根据您划的位置进行相应的添加的，类似网易新闻虎扑看球等的效果，后面再滑动到相应位置时不再重新添加，如果想刷新数据，您可以在相应的控制器里加入刷新功能，低耦合。需要注意的是，在创建您的控制器时，设置的frame为FUll_CONTENT_HEIGHT，即全屏高减去导航栏高度再减去Tabbar的高度，如果这个高度不是您想要的，您可以去UIParameter.h中进行设置XD。
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
/**< 每个标题下对应的控制器，只需将您创建的控制器类名加入下列数组即可(注意:数量应与上方的titles数量保持一致，若少于titles数量，下方会打印您缺少相应的控制器，同时默认设置的最大控制器数量为10=。=)  。
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
                       ];
```
* 如果您在配置NinaPagerView时出现TopTab被导航栏遮挡的情况(上移情况)，请尝试在您调用NinaPagerView的控制器所在的**导航控制器**中加入:
```objc
self.navigationBar.translucent = NO;
```
* 如果您想在创建的子控制器中加入TableView，直接在子控制器上直接添加可能会出现滑动的问题，所以您需要将TableView子类化后将view添加到控制器上方可解决此问题。(以后若解决此条作废=。=)
* 关于内存管理
    如果您觉得创建的控制器过多(>5)占用内存过大，可以尝试此代理方法，默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。
    If you care the vcs causes huge memory,please try this delegate,default is load recent 5 vcs,others will dealloc.If you scroll to the dealloc page, it will load again.If you don't use the delegate,default is NO
```objc
//Add <NinaPagerViewDelegate> to the ViewController and add codes(you can get more details in example):
- (BOOL)deallocVCsIfUnnecessary {
    return YES;
}
```
* 如果您在使用的过程中遇到任何问题或者建议，希望您issue我，帮助我来完善它。
* If you find bugs in this project or any suggestions,hope you can give me feedback by issues.

## Licence

This project uses MIT License.
