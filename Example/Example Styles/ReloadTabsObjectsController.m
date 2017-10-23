//
//  ReloadTabsObjectsController.m
//  NinaPagerView
//
//  Created by Jeff Zhao on 2017/5/2.
//  Copyright © 2017年 赵富阳. All rights reserved.
//

#import "ReloadTabsObjectsController.h"
#import "UIParameter.h"
#import "NinaPagerView.h"
#import "SecondViewController.h"
#import "FirstTableView.h"
#import "ForthCollectionView.h"
#import "TopTabTestController.h"

@interface ReloadTabsObjectsController ()<NinaPagerViewDelegate,ScrollHiddenDelegate>
@property (nonatomic, strong) NinaPagerView *ninaPagerView;
@end

@implementation ReloadTabsObjectsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ReloadTabsObjectsDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ninaPagerView];
    [self performSelector:@selector(reloadTopTabAndScrollView) withObject:nil afterDelay:5.0];
}


#pragma mark - NinaParaArrays
- (NSArray *)ninaTitleArray {
    return @[
             @"沙河口",
             @"人民广场",
             @"中山广场"
             ];
}

/**
 *  WithObjects传入方法3：适用于IB创建或者需要代码实例化创建的VC，如果您有此需求，请传入对应的VC即可，具体实现可参照下方代码。
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
    return @[
             firstVC,
             secondVC,
             firstTV,
             ];
}

#pragma mark - ScrollHiddenDelegate
- (void)upScrollAction:(BOOL)show {
    //If you wanna to make toptab hidden or show,you can try following codes and choose detailVCsArray(Line 39) as your default vcs array:
    //    self.ninaPagerView.topTabScrollHidden = show?NO:YES;
}

#pragma mark - LazyLoad
- (NinaPagerView *)ninaPagerView {
    if (!_ninaPagerView) {
        NSArray *titleArray = [self ninaTitleArray];
        NSArray *vcsArray = [self ninaDetailVCsArray];
        CGRect pagerRect = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        _ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithObjects:vcsArray];
        _ninaPagerView.ninaPagerStyles = NinaPagerStyleStateNormal;
    }
    return _ninaPagerView;
}

#pragma mark - Reload Titles and Objects
- (void)reloadTopTabAndScrollView {
    [self.ninaPagerView reloadTopTabByTitles:[self ninasTitleArray] WithObjects:[self ninasVCsArray]];
}

- (NSArray *)ninasTitleArray {
    return @[
                     @"大连市",
                     @"甘井子",
                     @"人民广场",
                     @"中山广场",
                     @"星海广场",
                     ];
}

- (NSArray *)ninasVCsArray {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    ForthCollectionView *forthCollectionView = [[ForthCollectionView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT) collectionViewLayout:layout];
    UIStoryboard *FifthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *fifthVC = [FifthStory instantiateViewControllerWithIdentifier:@"111"];
    UIStoryboard *sixthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *sixthVC = [sixthStory instantiateViewControllerWithIdentifier:@"222"];
    UIStoryboard *eighthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *eighthVC = [eighthStory instantiateViewControllerWithIdentifier:@"444"];
    UIStoryboard *ninthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *ninthVC = [ninthStory instantiateViewControllerWithIdentifier:@"555"];
    return @[
                     forthCollectionView,
                     fifthVC,
                     sixthVC,
                     eighthVC,
                     ninthVC
                     ];
}

@end
