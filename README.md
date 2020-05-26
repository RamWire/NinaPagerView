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
## Licence

This project uses MIT License.
