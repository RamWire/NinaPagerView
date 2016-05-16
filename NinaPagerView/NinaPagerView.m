//
//  NinaPagerView.m
//  NinaPagerView
//
//  Created by RamWire on 16/3/23.
//  Copyright © 2016年 RamWire. All rights reserved.
//

#import "NinaPagerView.h"
#import "UIParameter.h"
#import "NinaBaseView.h"
#import "UIView+ViewController.h"
#define MaxNums  10
static NSString *const kObserverPage = @"currentPage";

@interface NinaPagerView()<NSCacheDelegate>
@property (nonatomic, strong)NSCache *limitControllerCache; /**< 内存管理，避免创建过多的控制器所导致内存过于庞大   **/
@end

@implementation NinaPagerView
{
    NinaBaseView *pagerView;
    NSArray *myArray;
    NSArray *classArray;
    NSArray *colorArray;
    NSMutableArray *viewNumArray;
    NSMutableArray *vcsTagArray;
    NSMutableArray *vcsArray;
    BOOL viewAlloc[MaxNums];
    BOOL fontChangeColor;
    UIViewController *firstVC;
}

- (instancetype)initWithTitles:(NSArray *)titles WithVCs:(NSArray *)childVCs WithColorArrays:(NSArray *)colors {
    if (self = [super init]) {
        //Need You Edit,title for the toptabbar
        self.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        myArray = titles;
        classArray = childVCs;
        colorArray = colors;
         [self createPagerView:myArray WithVCs:classArray WithColors:colorArray];
    }
    return self;
}

#pragma mark - SetMethod
- (void)setPushEnabled:(BOOL )pushEnabled {
    if (pushEnabled == YES && firstVC != nil) {
        [self.viewController addChildViewController:firstVC];
    }
}

- (void)setTitleScale:(CGFloat)titleScale {
    _titleScale = titleScale;
    pagerView.titleScale = _titleScale;
}

#pragma mark - NSCache
- (NSCache *)limitControllerCache {
    if (!_limitControllerCache) {
        _limitControllerCache = [NSCache new];
        _limitControllerCache.delegate = self;
    }
    /**< 设置最大控制器的数量   **/
    _limitControllerCache.countLimit = 5;
    return _limitControllerCache;
}

#pragma mark - CreateView
- (void)createPagerView:(NSArray *)titles WithVCs:(NSArray *)childVCs WithColors:(NSArray *)colors {
    viewNumArray = [NSMutableArray array];
    vcsArray = [NSMutableArray array];
    vcsTagArray = [NSMutableArray array];
    //No Need to edit
    if (colors.count > 0) {
        for (NSInteger i = 0; i < colors.count; i++) {
            switch (i) {
                case 0:
                     _selectColor = colors[0];
                    break;
                case 1:
                    _unselectColor = colors[1];
                    break;
                case 2:
                    _underlineColor = colors[2];
                    break;
                case 3:
                    _topTabColor = colors[3];
                    break;
                default:
                    break;
            }  
        }
    }
    if (titles.count > 0 && childVCs.count > 0) {
        pagerView = [[NinaBaseView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT) WithSelectColor:_selectColor WithUnselectorColor:_unselectColor WithUnderLineColor:_underlineColor WithtopTabColor:_topTabColor];
        pagerView.titleArray = myArray;
        [pagerView addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
        [self addSubview:pagerView];
        //First ViewController present to the screen
        if (classArray.count > 0 && myArray.count > 0) {
            if ([classArray[0] isKindOfClass:[NSString class]]) {
                NSString *className = classArray[0];
                Class class = NSClassFromString(className);
                if ([class isSubclassOfClass:[UIViewController class]]) {
                    UIViewController *ctrl = class.new;
                    [self createFirstViewController:ctrl];
                }else if ([class isSubclassOfClass:[UIView class]]) {
                    UIView *singleView =class.new;
                    singleView.frame = CGRectMake(FUll_VIEW_WIDTH * 0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
                    [pagerView.scrollView addSubview:singleView];
                }
            }else {
                if ([classArray[0] isKindOfClass:[UIViewController class]]) {
                    UIViewController *ctrl = classArray[0];
                    [self createFirstViewController:ctrl];
                }else if ([classArray[0] isKindOfClass:[UIView class]]) {
                    UIView *singleView = classArray[0];
                    singleView.frame = CGRectMake(FUll_VIEW_WIDTH * 0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
                    [pagerView.scrollView addSubview:singleView];
                }
            }
        }
    }else {
        NSLog(@"You should correct titlesArray or childVCs count!");
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:kObserverPage]) {
        NSInteger page = [change[@"new"] integerValue];
        if (isDebug) {
            NSLog(@"现在是控制器%li",(long)page + 1);
        }
        self.PageIndex = @(page + 1).stringValue;
        if (myArray.count > 5) {
            CGFloat topTabOffsetX = 0;
            if (page >= 2) {
                if (page <= myArray.count - 3) {
                    topTabOffsetX = (page - 2) * More5LineWidth;
                }
                else {
                    if (page == myArray.count - 2) {
                        topTabOffsetX = (page - 3) * More5LineWidth;
                    }else {
                        topTabOffsetX = (page - 4) * More5LineWidth;
                    }
                }
            }
            else {
                if (page == 1) {
                    topTabOffsetX = 0 * More5LineWidth;
                }else {
                    topTabOffsetX = page * More5LineWidth;
                }
            }
            [pagerView.topTab setContentOffset:CGPointMake(topTabOffsetX, 0) animated:YES];
        }
        for (NSInteger i = 0; i < myArray.count; i++) {
            if (page == i && i <= classArray.count - 1) {
                if ([classArray[i] isKindOfClass:[NSString class]]) {
                    NSString *className = classArray[i];
                    Class class = NSClassFromString(className);
                    if ([class isSubclassOfClass:[UIViewController class]] && viewAlloc[i] == NO) {
                        UIViewController *ctrl = nil;
                        ctrl = class.new;
                        [self createOtherViewControllers:ctrl WithControllerTag:i];
                    }else if ([class isSubclassOfClass:[UIView class]]) {
                        UIView *singleView =class.new;
                        singleView.frame = CGRectMake(FUll_VIEW_WIDTH * i, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
                        [pagerView.scrollView addSubview:singleView];
                    }else if (!class) {
                        NSLog(@"您所提供的vc%li类并没有找到。  Your Vc%li is not found in this project!",(long)i + 1,(long)i + 1);
                    }
                }else {
                    if ([classArray[i] isKindOfClass:[UIViewController class]]) {
                        UIViewController *ctrl = classArray[i];
                        if (ctrl && viewAlloc[i] == NO) {
                            [self createOtherViewControllers:ctrl WithControllerTag:i];
                        }else if (!ctrl) {
                            NSLog(@"您所提供的vc%li类并没有找到。  Your Vc%li is not found in this project!",(long)i + 1,(long)i + 1);
                        }
                    }else if ([classArray[i] isKindOfClass:[UIView class]]) {
                        UIView *singleView = classArray[i];
                        singleView.frame = CGRectMake(FUll_VIEW_WIDTH * i, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
                        [pagerView.scrollView addSubview:singleView];
                    }
                }
            }else if (page == i && i > classArray.count - 1) {
                NSLog(@"您没有配置对应Title%li的VC",(long)i + 1);
            }else {
                /**<  内存管理限制控制器最大数量为5个   **/
                if ([self.delegate performSelector:@selector(deallocVCsIfUnnecessary)]) {
                    if (vcsArray.count > 5 && [self.delegate deallocVCsIfUnnecessary] == YES) {
                        UIViewController *deallocVC = [vcsArray firstObject];
                        NSInteger deallocTag = [[vcsTagArray firstObject] integerValue];
                        if (![self.limitControllerCache objectForKey:@(deallocTag)]) {
                            [self.limitControllerCache setObject:deallocVC forKey:@(deallocTag)];
                        };
                        [deallocVC.view removeFromSuperview];
                        deallocVC.view = nil;
                         [deallocVC removeFromParentViewController];
                        deallocVC = nil;
                        [vcsArray removeObjectAtIndex:0];
                        viewAlloc[deallocTag] = NO;
                        [vcsTagArray removeObjectAtIndex:0];
                    }
                }                
            }
        }
    }
}

- (void)dealloc {
    [pagerView removeObserver:self forKeyPath:@"currentPage"];
}

/**<  NSCache的代理方法，打印当前清除对象 **/
- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    if (isDebug) {
        NSLog(@"清除了-------> %@", obj);
    }
}

#pragma mark - Private Method
/**<  创建第一个控制器   **/
- (void)createFirstViewController:(UIViewController *)ctrl {
    firstVC = ctrl;
    ctrl.view.frame = CGRectMake(FUll_VIEW_WIDTH * 0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
    [pagerView.scrollView addSubview:ctrl.view];
    /**<  新添加测试cache   **/
    if (![self.limitControllerCache objectForKey:@(0)]) {
        [self.limitControllerCache setObject:ctrl forKey:@(0)];
    };
    viewAlloc[0] = YES;
    [vcsArray addObject:ctrl];
    [vcsTagArray addObject:@"0"];
    if (isDebug) {
        NSLog(@"现在是控制器1");
        NSLog(@"使用了新建的控制器0");
    }
    self.PageIndex = @"1";
}

/**<  创建其他控制器   **/
- (void)createOtherViewControllers:(UIViewController *)ctrl WithControllerTag:(NSInteger)i {
    [self.viewController addChildViewController:ctrl];
    [vcsArray addObject:ctrl];
    NSString *tagStr = @(i).stringValue;
    [vcsTagArray addObject:tagStr];
    if (isDebug) {
        NSLog(@"使用了新创建的控制器%li",(long)i + 1);
    }
    /**<  内存管理限制控制器最大数量为5个   **/
    if ([self.delegate performSelector:@selector(deallocVCsIfUnnecessary)]) {
        if (vcsArray.count > 5 && [self.delegate deallocVCsIfUnnecessary] == YES) {
            UIViewController *deallocVC = [vcsArray firstObject];
            NSInteger deallocTag = [[vcsTagArray firstObject] integerValue];
            if (![self.limitControllerCache objectForKey:@(deallocTag)]) {
                [self.limitControllerCache setObject:deallocVC forKey:@(deallocTag)];
            };
            [deallocVC.view removeFromSuperview];
            deallocVC.view = nil;
            [deallocVC removeFromParentViewController];
            deallocVC = nil;
            [vcsArray removeObjectAtIndex:0];
            viewAlloc[deallocTag] = NO;
            if (isDebug) {
                NSLog(@"控制器%li被清除了",(long)deallocTag + 1);
            }            
            [vcsTagArray removeObjectAtIndex:0];
        }
    }
    ctrl.view.frame = CGRectMake(FUll_VIEW_WIDTH * i, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
    [pagerView.scrollView addSubview:ctrl.view];
    viewAlloc[i] = YES;
}

@end
