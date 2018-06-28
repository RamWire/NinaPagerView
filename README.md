![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/Slice1.png)
[![Language](https://img.shields.io/badge/Language-%20Objective--C%20-orange.svg)](https://img.shields.io/badge/Language-%20Objective--C%20-orange.svg)
[![Build Status](https://travis-ci.org/RamWire/NinaPagerView.svg?branch=master)](https://travis-ci.org/RamWire/NinaPagerView)
[![Pod Version](http://img.shields.io/cocoapods/v/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Pod Platform](http://img.shields.io/cocoapods/p/NinaPagerView.svg?style=flat)](http://cocoadocs.org/docsets/NinaPagerView/)
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![Pod License](http://img.shields.io/cocoapods/l/NinaPagerView.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)<br />
🇨🇳[中文文档说明](https://github.com/RamWire/NinaPagerView/blob/master/README_CN.md)
* NinaPagerView is a segment easy to page your controllers and views.<br />

## Features
- [x] Low coupling,just create your own viewcontrollers or views,that's it!
- [x] Load your viewcontrollers or views.Not load at the same time.
- [x] Just one line codes to finish the mission.
- [x] Edit everything in TopTab as you wish,you can custom your own views here.
- [x] Not only fits UIViewController,but also fits UIView.
- [x] Select NinaPagerStyle as you wish.
- [x] Easily reload titles and objects(views,controllers and xibs).

## Preview

![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif1.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif2.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif3.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif4.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif5.gif)

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
```objc
NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithObjects:objects];
[self.view addSubview:ninaPagerView];
```
That's all!

### Other Settings and Tips
* Numerous **properties** in NinaPagerView you can set as you wish.
* NinaPagerView now supports **custom topTab menus**.Creating your own views into NinaPagerView!(read the Example notes if you wanna to know more)
* You can set two necessary Array by following codes(please read the Example notes if you wanna to know more).
```objc
NSArray *titles = @[
                    @"Dalian",
                    @"Tokyo",
                    @"New York",
                    @"Los Angeles",
                    @"Kyoto",
                    @"Osaka",
                    @"Auckland",
                    @"Miami",
                    @"Houston"
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
* If your controller doesn't have navigationBar or you hide the navigationBar,you need set **nina_navigationBarHidden** to YES. 
```objc
ninaPagerView.nina_navigationBarHidden = YES;
```
* Superior limit of creating  controllers or views is **10**,if wanna more,please modify **MaxNums** in NinaPagerView.
* If you need push to the controller which contains NinaPagerView,please make sure your **navigationBar's translucent** is **NO**.You can set like this:
```objc
self.navigationController.navigationBar.translucent = NO;
```
* If you use controllers way, please make sure add subview in viewWillLayoutSubviews method, it's not work in viewDidLoad method, you can find more in demo.

### NinaPagerViewDelegate
#### Memory Management
* If you care the vcs causes huge memory,please try NinaPagerViewDelegate delegate,default is load recent 5 vcs,others will dealloc.If you scroll to the dealloc page, it will load again.If you don't use the delegate,default is NO.
```objc
- (BOOL)deallocVCsIfUnnecessary {
  return YES;
}
```
#### Current Page
* Get current page and objects by the delegate method, you can code here when you need it. 
```objc
- (void)ninaCurrentPageIndex:(NSInteger)currentPage currentObject:(id)currentObject lastObject:(id)lastObject {
    NSLog(@"Current page is %li",currentPage);
}
```

## Change Log
#### v1.6.3
Bug fixes.<br />
#### v1.6.2
Updated codes for iOS 11，and other improvements.<br />
#### v1.6.0
Add **ninaChosenPage** and reload data function.<br />
#### v1.5.3
Add **topTabScrollHidden** function.<br />
#### v1.5.1
Add **custom topTab menus** function,custom your own topTab!<br />
#### v1.4.8
Add nina_scrollEnabled and nina_autoBottomLineEnable functions to NinaPagerView,meanwhile try to fix KVO crash in some conditions.<br />
#### v1.4.6
Fix a bug may cause NinaPagerView in wrong location.<br />
#### v1.4.5
Fix scrollsToTop conflict issue.<br />
#### v1.4.3
Add properties for setting colors,now you just set frame,titleArray and vcsArray in init method.<br />
#### v1.4.2
Add properties for setting topTab's height and title font,what's more,able to set toptab whole underline hidden.<br />
#### v1.4.1
Fix some bugs and now you need not set navigationBar.translucent to NO,NinaPagerView will do it.<br />
#### v1.4.0
Change numerous macro definitions to NinaPagerView's properties.More flexible to use NinaPagerView in different situations.<br />
#### v1.3.0
Add NinaDefaultPageIndex in UIParameter.h to select default page. <br />
#### v1.2.0
Add LoadWholePage in parameter.h that you can set YES to load all controllers or views at the same time. <br />
New delegate method for NinaPagerView to get current page easily.<br />
#### v1.1.2
Optimize two-line title and details in SlideBlock.<br />
#### v1.1.1
NinaSlideBlock support two-line display in NinaPagerView.<br />
#### v1.1.0
Support navigationBarHidden situation,now you can select navigationBar hidden or not.<br />
#### v1.0.0
Improves some codes,meanwhile brings some changes for the framework,wish you like it:)<br />
**(1)** Add a new NinaPagerStyle:**NinaPagerStyleStateNormal**,it's a style which not has bottomline or sliderblock.You can choose it if needed.<br />
**(2)** Creating Arrays in Example is changed,more clearly!<br />
**(3)** TopTab height fasten to 40,if you wanna to change it,please set it in UIParameter.h.<br />
**(4)** In NinaPagerStyleSliderBlock,now you can set block's cornerRadius by setting in UIParameter.h.<br />
#### v0.9.1
Add some parameters to toptab's bottomline or slider,now you can set their width and height to the project.<br />
#### v0.8.1
Fix topTab vertical-scroll in some conditions.<br />
#### v0.8.0
New selection of topTab style,now you can choose **NinaPagerStyleBottomLine** and **NinaPagerStyleSlideBlock** as gifs showed.<br />
#### v0.7.0
If you think vcs is not comfortable for your project, you can use view arrays to built.Just put views into array~<br />
#### v0.6.0
Support long-length title.<br />
#### v0.5.2
You can set titleSize for title animation(compare to origin title),command range between 1 and 1.5.If don't set this,default scale is 1.15.
```objc
ninaPagerView.titleScale = 1.5;
```
#### v0.5.0
If you wanna create VCs by **IB** or code by yourself, you can put VCs into array.You can create them like the Example codes.

## FeedBack
* If you find bugs in this project or any suggestions,hope you can give me feedback by issues or Email me to zhaogengda@126.com.

## Licence

This project uses MIT License.
