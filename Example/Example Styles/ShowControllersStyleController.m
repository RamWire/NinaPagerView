//
//  ShowControllersStyleController.m
//  NinaPagerView
//
//  Created by RamWire on 2017/4/18.
//  Copyright © 2017年 RamWire. All rights reserved.
//

#import "ShowControllersStyleController.h"
#import "UIParameter.h"
#import "NinaPagerView.h"

@interface ShowControllersStyleController ()
@property (nonatomic, strong) NinaPagerView *ninaPagerView;
@end

@implementation ShowControllersStyleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ShowControllersWithBottomLineStyle";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ninaPagerView];
}

#pragma mark - NinaParaArrays
/**
 *  上方显示标题(您需要注意的是，虽然框架中对长标题进行了优化处理，但是建议您设置标题时汉字的长度不要超过10)。
 *  Titles showing on the topTab
 *
 *  @return Array of titles.
 */
- (NSArray *)ninaTitleArray {
    return @[
             @"大连市",
             @"甘井子",
             @"星海广场",
             @"西岗",
             @"马栏子",
             @"革镇堡",
             @"沙河口",
             @"人民广场",
             @"中山广场"
             ];
}

/**
 *  WithObjects传入方法1：每个标题下对应的控制器，只需将您创建的控制器类名加入下列数组即可(注意:数量应与上方的titles数量保持一致，若少于titles数量，下方会打印您缺少相应的控制器，同时默认设置的最大控制器数量为10)  。
 *  ViewControllers to the titles on the topTab.Just add your VCs' Class Name to the array. Wanning:the number of ViewControllers should equal to the titles.Meanwhile,default max VC number is 10.
 *
 *  @return Array of controllers' class names.
 */
- (NSArray *)ninaVCsArray {
    return @[
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
}

#pragma mark - LazyLoad
- (NinaPagerView *)ninaPagerView {
    if (!_ninaPagerView) {
        NSArray *titleArray = [self ninaTitleArray];
        NSArray *vcsArray = [self ninaVCsArray];
        /**
         *  创建ninaPagerView，控制器第一次是根据您划的位置进行相应的添加的，类似网易新闻虎扑看球等的效果，后面再滑动到相应位置时不再重新添加，如果想刷新数据，您可以在相应的控制器里加入刷新功能。需要注意的是，在创建您的控制器时，设置的frame为FUll_CONTENT_HEIGHT，即全屏高减去导航栏高度，如果这个高度不是您想要的，您可以去在下面的frame自定义设置。
         *  A tip you should know is that when init the VCs frames,the default frame i set is FUll_CONTENT_HEIGHT,it means fullscreen height - NavigationHeight - TabbarHeight.If the frame is not what you want,just set frame as you wish.
         */
        CGRect pagerRect = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        _ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithObjects:vcsArray];
        _ninaPagerView.ninaPagerStyles = NinaPagerStyleBottomLine;
    }
    return _ninaPagerView;
}

@end
