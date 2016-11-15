//
//  ViewController.m
//  NinaPagerView
//
//  Created by RamWire on 15/11/13.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#import "ViewController.h"
#import "UIParameter.h"
#import "NinaPagerView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "FirstTableView.h"
#import "SecondTableView.h"
#import "ForthCollectionView.h"
#import "TopTabView.h"
#import "TopTabTestController.h"

@interface ViewController()<NinaPagerViewDelegate,ScrollHiddenDelegate>
@property (nonatomic, strong) NinaPagerView *ninaPagerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nina";
    [self.view addSubview:self.ninaPagerView];
}

#pragma mark - LazyLoad
- (NinaPagerView *)ninaPagerView {
    if (!_ninaPagerView) {
        //Need You Edit
        NSArray *titleArray = [self ninaTitleArray];
        //Three choices
            NSArray *vcsArray = [self ninaVCsArray];
        //    NSArray *viewsArray = [self ninaViewsArray];
//        NSArray *detailVCsArray = [self ninaDetailVCsArray];
        /**
         *  创建ninaPagerView，控制器第一次是根据您划的位置进行相应的添加的，类似网易新闻虎扑看球等的效果，后面再滑动到相应位置时不再重新添加，如果想刷新数据，您可以在相应的控制器里加入刷新功能。需要注意的是，在创建您的控制器时，设置的frame为FUll_CONTENT_HEIGHT，即全屏高减去导航栏高度，如果这个高度不是您想要的，您可以去在下面的frame自定义设置。
         *  A tip you should know is that when init the VCs frames,the default frame i set is FUll_CONTENT_HEIGHT,it means fullscreen height - NavigationHeight - TabbarHeight.If the frame is not what you want,just set frame as you wish.
         */
        CGRect pagerRect = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        _ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithVCs:vcsArray];
        _ninaPagerView.ninaPagerStyles = NinaPagerStyleBottomLine;
        _ninaPagerView.ninaDefaultPage = 0;
        _ninaPagerView.loadWholePages = NO;
        //Custom TopTab menus(optional)
        _ninaPagerView.topTabViews = [self topTabViewArray];
        _ninaPagerView.selectedTopTabViews = [self changeTopArray];
    }
    return _ninaPagerView;
}

#pragma mark - ScrollHiddenDelegate
- (void)upScrollAction:(BOOL)show {
    //If you wanna to make toptab hidden or show,you can try following codes and choose detailVCsArray(Line 39) as your default vcs array:
//    self.ninaPagerView.topTabScrollHidden = show?NO:YES;
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
 *  WithVCs传入方法1：每个标题下对应的控制器，只需将您创建的控制器类名加入下列数组即可(注意:数量应与上方的titles数量保持一致，若少于titles数量，下方会打印您缺少相应的控制器，同时默认设置的最大控制器数量为10)  。
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

/**
 *  WithVCs传入方法2：0.7新增:对view数组的支持，您如果觉得viewController数组对于您的项目来说太重并且在呈现界面时不需要这么多Controller进行处理，您可以通过相同的形式将您所想添加的view加入数组中传入NinaPagerView。
 *  If you think vcs is not comfortable for your project, you can use view arrays to built.Just put views into array.
 *
 *  @return Array of views' class names.
 */
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
 *  WithVCs传入方法3：适用于IB创建或者需要代码实例化创建的VC，如果您有此需求，请传入对应的VC即可，具体实现可参照下方代码。
 *  If you think vcs is not comfortable for your project, you can use view arrays to built.Just put views into array.
 *
 *  @return Array of views or controllers
 */
- (NSArray *)ninaDetailVCsArray {
    //Test init views and viewcontrollers,support creating views or viewcontroller by xib.
    TopTabTestController *firstVC = [TopTabTestController new];
    firstVC.upScrollDelegate = self;
    SecondViewController *secondVC = [SecondViewController new];
    FirstTableView *firstTV = [[FirstTableView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT) style:UITableViewStylePlain];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    ForthCollectionView *forthCollectionView = [[ForthCollectionView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT) collectionViewLayout:layout];
    UIStoryboard *FifthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *fifthVC = [FifthStory instantiateViewControllerWithIdentifier:@"111"];
    UIStoryboard *sixthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *sixthVC = [sixthStory instantiateViewControllerWithIdentifier:@"222"];
    UIStoryboard *seventhStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *seventhVC = [seventhStory instantiateViewControllerWithIdentifier:@"333"];
    UIStoryboard *eighthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *eighthVC = [eighthStory instantiateViewControllerWithIdentifier:@"444"];
    UIStoryboard *ninthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *ninthVC = [ninthStory instantiateViewControllerWithIdentifier:@"555"];
    return @[
             firstVC,
             secondVC,
             firstTV,
             forthCollectionView,
             fifthVC,
             sixthVC,
             seventhVC,
             eighthVC,
             ninthVC
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

@end
