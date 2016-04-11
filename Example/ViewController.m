//
//  ViewController.m
//  NinaPagerView
//
//  Created by 赵富阳 on 15/11/13.
//  Copyright © 2015年 赵富阳. All rights reserved.
//

#import "ViewController.h"
#import "UIParameter.h"
#import "NinaPagerView.h"

@interface ViewController()<NinaPagerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nina";
    self.navigationController.navigationBar.translucent = NO;
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
    /**< 您可以选择是否要改变标题选中的颜色(默认为黑色)、未选中的颜色(默认为灰色)或者下划线的颜色(默认为色值是ff6262)，上方菜单栏背景色(默认为白色)。如果传入颜色数量不够，则按顺序给相应的部分添加颜色。
        You can choose whether change your titles' selectColor(default is black),unselectColor(default is gray) and underline color(default is Color value ff6262),topTabBackGround color(default is white).**/
    NSArray *colorArray = @[
                                                [UIColor brownColor], /**< 选中的标题颜色 Title SelectColor  **/
                                                [UIColor grayColor], /**< 未选中的标题颜色  Title UnselectColor **/
                                                [UIColor redColor], /**< 下划线颜色 Underline Color   **/
                                                [UIColor whiteColor], /**<  上方菜单栏的背景颜色 TopTab Background Color   **/
                                                ];
    /**< 创建ninaPagerView，控制器第一次是根据您划的位置进行相应的添加的，类似网易新闻虎扑看球等的效果，后面再滑动到相应位置时不再重新添加，如果想刷新数据，您可以在相应的控制器里加入刷新功能，低耦合。需要注意的是，在创建您的控制器时，设置的frame为FUll_CONTENT_HEIGHT，即全屏高减去导航栏高度再减去Tabbar的高度，如果这个高度不是您想要的，您可以去UIParameter.h中进行设置XD。
        A tip you should know is that when init the VCs frames,the default frame i set is FUll_CONTENT_HEIGHT,it means fullscreen height - NavigationHeight - TabbarHeight.If the frame is not what you want,just go to UIParameter.h to change it!XD**/
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithTitles:titleArray WithVCs:vcsArray WithColorArrays:colorArray];
    ninaPagerView.delegate = self;
    [self.view addSubview:ninaPagerView];
    /**< 因为在框架里设置的问题，所以您如果需要在第一个控制器中需要push到二级控制器的话，需要多加上下方的这行代码，并且
     此行代码需要在addSubView的后面。
        Because of the framework setting,you must add following codes under the line after addSubView codes in order to push second level VC. **/
    ninaPagerView.pushEnabled = YES;
}

/**< 如果您觉得创建的控制器过多(>5)占用内存过大，可以尝试此代理方法，默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。
        If you care the vcs causes huge memory,please try this delegate,default is load recent 5 vcs,others will dealloc.If you scroll to the dealloc page, it will load again.If you don't use the delegate,default is NO **/
- (BOOL)deallocVCsIfUnnecessary {
    return YES;
}

@end
