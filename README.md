![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/Slice 2.png)
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
- [x] Edit everything in TopTab as you wish.
- [x] Not only fits UIViewController,but also fits UIView.
- [x] Select NinaPagerStyle as you wish.

## Preview

![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif1.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif2.gif)
![image](https://github.com/RamWire/NinaPagerView/blob/master/Example/Gifs/NinaPagerViewGif3.gif)

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
NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithNinaPagerStyle:NinaPagerStyleSlideBlock WithTitles:titleArray WithVCs:vcsArray WithColorArrays:colorArray];
[self.view addSubview:ninaPagerView];
```
That's all!

### Other Settings and Tips
* You can set three necessary Array by following codes(please read the Example notes if you wanna to know more).
```objc
NSArray *titleArray = @[
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
                        [UIColor brownColor], /**< Title SelectColor  **/
                        [UIColor grayColor], /**< Title UnselectColor **/
                        [UIColor redColor], /**< Underline or SlideBlock Color   **/
                        [UIColor whiteColor], /**< TopTab Background Color   **/
                       ];
```
* If TopTab shelters from navigationBar,please try to add the following codes into the controller that you create NinaPagerView:
```objc
self.navigationController.navigationBar.translucent = NO;
```
* Because of the framework setting,you must add following codes under the line after addSubView codes in order to push second level VC. 
```objc
ninaPagerView.pushEnabled = YES;
```
* If you wanna hidden the navigationBar,you can set nina_navigationBarHidden to YES. 
```objc
ninaPagerView.nina_navigationBarHidden = YES;
```

### Memory Management
* If you care the vcs causes huge memory,please try NinaPagerViewDelegate delegate,default is load recent 5 vcs,others will dealloc.If you scroll to the dealloc page, it will load again.If you don't use the delegate,default is NO.
```objc
- (BOOL)deallocVCsIfUnnecessary {
  return YES;
}
```

## Change Log
####v1.1.2
Optimize two-line title and details in SlideBlock.<br />
####v1.1.1
NinaSlideBlock support two-line display in NinaPagerView.<br />
####v1.1.0
Support navigationBarHidden situation,now you can select navigationBar hidden or not.<br />
####v1.0.0
Improves some codes,meanwhile brings some changes for the framework,wish you like it:)<br />
**(1)** Add a new NinaPagerStyle:**NinaPagerStyleStateNormal**,it's a style which not has bottomline or sliderblock.You can choose it if needed.<br />
**(2)** Creating Arrays in Example is changed,more clearly!<br />
**(3)** TopTab height fasten to 40,if you wanna to change it,please set it in UIParameter.h.<br />
**(4)** In NinaPagerStyleSliderBlock,now you can set block's cornerRadius by setting in UIParameter.h.<br />
####v0.9.1
Add some parameters to toptab's bottomline or slider,now you can set their width and height to the project.<br />
####v0.8.1
Fix topTab vertical-scroll in some conditions.<br />
####v0.8.0
New selection of topTab style,now you can choose **NinaPagerStyleBottomLine** and **NinaPagerStyleSlideBlock** as gifs showed.<br />
####v0.7.0
If you think vcs is not comfortable for your project, you can use view arrays to built.Just put views into array~<br />
####v0.6.0
Support long-length title.<br />
####v0.5.2
You can set titleSize for title animation(compare to origin title),command range between 1 and 1.5.If don't set this,default scale is 1.15.
```objc
ninaPagerView.titleScale = 1.5;
```
####v0.5.0
If you wanna create VCs by **IB** or code by yourself, you can put VCs into array.You can create them like the Example codes.

## FeedBack
* If you find bugs in this project or any suggestions,hope you can give me feedback by issues or Email me to zhaogengda@126.com.

## Licence

This project uses MIT License.
