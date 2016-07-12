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

@interface ViewController()<NinaPagerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nina";
    self.navigationController.navigationBar.translucent = NO;
    //Need You Edit
    /**
     *  上方显示标题(您需要注意的是，虽然框架中对长标题进行了优化处理，但是建议您设置标题时汉字的长度不要超过10)。
     *  Titles showing on the topTab
     */
    NSArray *titleArray = [self ninaTitleArray];
    /**
     *  传入方法1：每个标题下对应的控制器，只需将您创建的控制器类名加入下列数组即可(注意:数量应与上方的titles数量保持一致，若少于titles数量，下方会打印您缺少相应的控制器，同时默认设置的最大控制器数量为10)  。
     *  ViewControllers to the titles on the topTab.Just add your VCs' Class Name to the array. Wanning:the number of ViewControllers should equal to the titles.Meanwhile,default max VC number is 10.
     */
    NSArray *vcsArray = [self ninaVCsArray];
    /**
     *  传入方法2：0.7新增:对view数组的支持，您如果觉得viewController数组对于您的项目来说太重并且在呈现界面时不需要这么多Controller进行处理，您可以通过相同的形式将您所想添加的view加入数组中传入NinaPagerView。
     *  If you think vcs is not comfortable for your project, you can use view arrays to built.Just put views into array~
     */
//    NSArray *viewsArray = [self ninaViewsArray];
    /**
     *  传入方法3：适用于IB创建或者需要代码实例化创建的VC，如果您有此需求，请传入对应的VC即可，具体实现可参照下方代码。
     *  If you think vcs is not comfortable for your project, you can use view arrays to built.Just put views into array~
     */
//    NSArray *detailVCsArray = [self ninaDetailVCsArray];
    /**
     *  您可以选择是否要改变标题选中的颜色(默认为黑色)、未选中的颜色(默认为灰色)或者下划线的颜色(默认为色值是ff6262)，上方菜单栏背景色(默认为白色)。如果传入颜色数量不够，则按顺序给相应的部分添加颜色。
     *  You can choose whether change your titles' selectColor(default is black),unselectColor(default is gray) and underline color(default is Color value ff6262),topTabBackGround color(default is white).
     */
    NSArray *colorArray = [self ninaColorArray];
    /**
     *  创建ninaPagerView，控制器第一次是根据您划的位置进行相应的添加的，类似网易新闻虎扑看球等的效果，后面再滑动到相应位置时不再重新添加，如果想刷新数据，您可以在相应的控制器里加入刷新功能，低耦合。需要注意的是，在创建您的控制器时，设置的frame为FUll_CONTENT_HEIGHT，即全屏高减去导航栏高度再减去Tabbar的高度，如果这个高度不是您想要的，您可以去UIParameter.h中进行设置XD。
     *  A tip you should know is that when init the VCs frames,the default frame i set is FUll_CONTENT_HEIGHT,it means fullscreen height - NavigationHeight - TabbarHeight.If the frame is not what you want,just go to UIParameter.h to change it!XD
     */
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithNinaPagerStyle:NinaPagerStyleBottomLine WithTitles:titleArray WithVCs:vcsArray WithColorArrays:colorArray];
    /**
     *  Tag0.5.2 添加:您可以设置titleSize这个属性来设置标题的缩放比例(相对于原比例标题)，推荐您设置的范围在1~1.5之间，如果不设置此属性，默认的缩放比例为1.15。(0.8:titleScale现在只适用于NinaPagerStyleBottomLine类型)。
     *  Tag0.5.2 Add:You can set titleSize for title animation(compare to origin title),command range between 1 and 1.5.If don't set this,default scale is 1.15.
     */
    ninaPagerView.titleScale = 1.15;
//    ninaPagerView.delegate = self;
    [self.view addSubview:ninaPagerView];
    /**
     *  因为在框架里设置的问题，所以您如果需要在第一个控制器中需要push到二级控制器的话，需要多加上下方的这行代码，并且此行代码需要在addSubView的后面。
     *  Because of the framework setting,you must add following codes under the line after addSubView codes in order to push second level VC.
     */
    ninaPagerView.pushEnabled = YES;
    /**
     *  如果您需要将导航栏隐藏，您可以对此参数nina_navigationBarHidden设置成YES。
     *  If you wanna hidden the navigationBar,you can set nina_navigationBarHidden to YES.
     */
    ninaPagerView.nina_navigationBarHidden = YES;
}

#pragma mark - NinaPagerViewDelegate
/**
 *  如果您觉得创建的控制器(0.7:只适用于控制器情况)过多(>5)占用内存过大，可以尝试此代理方法，默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。
 *  If you care the vcs causes huge memory,please try this delegate,default is load recent 5 vcs,others will dealloc.If you scroll to the dealloc page, it will load again.If you don't use the delegate,default is NO. */
- (BOOL)deallocVCsIfUnnecessary {
    return YES;
}

#pragma mark - NinaParaArrays
- (NSArray *)ninaColorArray {
    return @[
                      [UIColor blackColor], /**< 选中的标题颜色 Title SelectColor  **/
                      [UIColor grayColor], /**< 未选中的标题颜色  Title UnselectColor **/
                      [UIColor blackColor], /**< 下划线颜色或滑块颜色 Underline or SlideBlock Color   **/
                      [UIColor whiteColor], /**<  上方菜单栏的背景颜色 TopTab Background Color   **/
                      ];
}

- (NSArray *)ninaTitleArray {
    return @[
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
}

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

- (NSArray *)ninaDetailVCsArray {
    //Test init views and viewcontrollers,support creating views or viewcontroller by xib.
    FirstViewController *firstVC = [FirstViewController new];
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

@end
