//
//  CostomTopStyleController.m
//  NinaPagerView
//
//  Created by RamWire on 2017/4/18.
//  Copyright © 2017年 RamWire. All rights reserved.
//

#import "CostomTopStyleController.h"
#import "UIParameter.h"
#import "NinaPagerView.h"
#import "TopTabView.h"

@interface CostomTopStyleController ()<NinaPagerViewDelegate>
@property (nonatomic, strong) NinaPagerView *ninaPagerView;
@end

@implementation CostomTopStyleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CostomTopWithBottomLineStyle";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ninaPagerView];
}

#pragma mark - NinaParaArrays
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

- (NSArray *)ninaViewsArray {
    return @[
             @"FirstTableView",
             @"SecondTableView",
             @"ThirdTableView",
             @"FirstTableView",
             @"SecondTableView",
             @"ThirdTableView",
             @"FirstTableView",
             @"SecondTableView",
             @"ThirdTableView",
             ];
}

/**
 *  未选中的自定义视图创建：示例展示的为左图右文字的一种样式，您可以根据需求对里面的内容进行子类化的创建，此数组包含的成员数量应与上方的标题和控制器数量一致(此自定义方式在NinaPagerStyleSlideBlock中并不适用)。
 *  Normal custom topTab views creation:Example codes shows a kind of type which is left-image right-label.You can custom your views if you want.Please set topTabViewArray's count is the same with title and vcs array's count(This function doesn't support NinaPagerStyleSlideBlock mode).
 *
 *  @return Array of views or controllers
 */
- (NSArray *)topTabViewArray {
    return @[
             [[TopTabView alloc] initWithLeftImageName:@"bank_un" WithRightTitle:@"bank" WithTitleColor:UIColorFromRGB(0xcdcdcd)],
             [[TopTabView alloc] initWithLeftImageName:@"clock_un" WithRightTitle:@"clock" WithTitleColor:UIColorFromRGB(0xcdcdcd)],
             [[TopTabView alloc] initWithLeftImageName:@"cup_un" WithRightTitle:@"cup" WithTitleColor:UIColorFromRGB(0xcdcdcd)],
             [[TopTabView alloc] initWithLeftImageName:@"heart_un" WithRightTitle:@"heart"WithTitleColor:UIColorFromRGB(0xcdcdcd)],
             [[TopTabView alloc] initWithLeftImageName:@"lab_un" WithRightTitle:@"lab" WithTitleColor:UIColorFromRGB(0xcdcdcd)],
             [[TopTabView alloc] initWithLeftImageName:@"like_un" WithRightTitle:@"like" WithTitleColor:UIColorFromRGB(0xcdcdcd)],
             [[TopTabView alloc] initWithLeftImageName:@"data_un" WithRightTitle:@"data" WithTitleColor:UIColorFromRGB(0xcdcdcd)],
             [[TopTabView alloc] initWithLeftImageName:@"tv_un" WithRightTitle:@"tv" WithTitleColor:UIColorFromRGB(0xcdcdcd)],
             [[TopTabView alloc] initWithLeftImageName:@"display_un" WithRightTitle:@"pc" WithTitleColor:UIColorFromRGB(0xcdcdcd)],
             ];
}

/**
 *  选中的自定义视图创建：示例展示的为左图右文字的一种样式，您可以根据需求对里面的内容进行子类化的创建，此数组包含的成员数量应与上方的标题和控制器数量一致(此自定义方式在NinaPagerStyleSlideBlock中并不适用)。
 *  Selected custom topTab views creation:Example codes shows a kind of type which is left-image right-label.You can custom your views if you want.Please set topTabViewArray's count is the same with title and vcs array's count(This function doesn't support NinaPagerStyleSlideBlock mode).
 *
 *  @return Array of views or controllers
 */
- (NSArray *)changeTopArray {
    return @[
             [[TopTabView alloc] initWithLeftImageName:@"bank" WithRightTitle:@"bank" WithTitleColor:UIColorFromRGB(0x333333)],
             [[TopTabView alloc] initWithLeftImageName:@"clock" WithRightTitle:@"clock" WithTitleColor:UIColorFromRGB(0x333333)],
             [[TopTabView alloc] initWithLeftImageName:@"cup" WithRightTitle:@"cup" WithTitleColor:UIColorFromRGB(0x333333)],
             [[TopTabView alloc] initWithLeftImageName:@"heart" WithRightTitle:@"heart" WithTitleColor:UIColorFromRGB(0x333333)],
             [[TopTabView alloc] initWithLeftImageName:@"lab" WithRightTitle:@"lab" WithTitleColor:UIColorFromRGB(0x333333)],
             [[TopTabView alloc] initWithLeftImageName:@"like" WithRightTitle:@"like" WithTitleColor:UIColorFromRGB(0x333333)],
             [[TopTabView alloc] initWithLeftImageName:@"data" WithRightTitle:@"data" WithTitleColor:UIColorFromRGB(0x333333)],
             [[TopTabView alloc] initWithLeftImageName:@"tv" WithRightTitle:@"tv" WithTitleColor:UIColorFromRGB(0x333333)],
             [[TopTabView alloc] initWithLeftImageName:@"display" WithRightTitle:@"pc" WithTitleColor:UIColorFromRGB(0x333333)],
             ];
}

#pragma mark - LazyLoad
- (NinaPagerView *)ninaPagerView {
    if (!_ninaPagerView) {
        //Need You Edit
        NSArray *titleArray = [self ninaTitleArray];
        NSArray *viewsArray = [self ninaViewsArray];
        CGRect pagerRect = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        _ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithObjects:viewsArray];
        _ninaPagerView.ninaPagerStyles = NinaPagerStyleBottomLine;
        _ninaPagerView.ninaDefaultPage = 0;
        _ninaPagerView.loadWholePages = NO;
        //Custom TopTab menus(optional)
        _ninaPagerView.topTabViews = [self topTabViewArray];
        _ninaPagerView.selectedTopTabViews = [self changeTopArray];
    }
    return _ninaPagerView;
}

@end
