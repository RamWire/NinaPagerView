// The MIT License (MIT)
//
// Copyright (c) 2015-2016 RamWire ( https://github.com/RamWire )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "NinaPagerView.h"
#import "UIParameter.h"
#import "NinaBaseView.h"
#import "UIView+ViewController.h"
#define MaxNums  10
static NSString *const kObserverPage = @"currentPage";

@interface NinaPagerView()<NSCacheDelegate>
@property (nonatomic, strong)NSCache *limitControllerCache;
@end

@implementation NinaPagerView
{
    NinaBaseView *pagerView;
    NSArray *myArray;
    NSArray *classArray;
    NSArray *colorArray;
    NSInteger pagerStyle;
    NSMutableArray *viewNumArray;
    NSMutableArray *vcsTagArray;
    NSMutableArray *vcsArray;
    BOOL viewAlloc[MaxNums];
    UIViewController *firstVC;
    NSInteger defaultPage;
}

- (instancetype)initWithNinaPagerStyle:(NinaPagerStyle)ninaPagerStyle WithTitles:(NSArray *)titles WithVCs:(NSArray *)childVCs WithColorArrays:(NSArray *)colors {
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        myArray = titles;
        classArray = childVCs;
        colorArray = colors;
        pagerStyle = ninaPagerStyle;
        defaultPage = (NinaDefaultPageIndex > 0 && NinaDefaultPageIndex < titles.count)?NinaDefaultPageIndex:0;
         [self createPagerView:myArray WithVCs:classArray WithColors:colorArray];
    }
    return self;
}

#pragma mark - SetMethod
- (void)setPushEnabled:(BOOL )pushEnabled {
    if (LoadWholePage && pushEnabled == YES) {
        for (NSInteger i = 0; i < vcsArray.count; i++) {
            [self.viewController addChildViewController:vcsArray[i]];
        }
    }else {
        if (pushEnabled == YES && firstVC != nil) {
            [self.viewController addChildViewController:firstVC];
        }
    }
}

- (void)setTitleScale:(CGFloat)titleScale {
    _titleScale = titleScale;
    pagerView.titleScale = _titleScale;
}

- (void)setNina_navigationBarHidden:(BOOL)nina_navigationBarHidden {
    if (nina_navigationBarHidden == YES) {
        self.viewController.automaticallyAdjustsScrollViewInsets = NO;
        pagerView.topTab.frame = CGRectMake(0, 20, FUll_VIEW_WIDTH, PageBtn);
        pagerView.scrollView.frame = CGRectMake(0, PageBtn + 20, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
    }
}

#pragma mark - NSCache
- (NSCache *)limitControllerCache {
    if (!_limitControllerCache) {
        _limitControllerCache = [NSCache new];
        _limitControllerCache.delegate = self;
    }
    /**< Set max of controller's number   **/
    _limitControllerCache.countLimit = 5;
    return _limitControllerCache;
}

#pragma mark - CreateView
- (void)createPagerView:(NSArray *)titles WithVCs:(NSArray *)childVCs WithColors:(NSArray *)colors {
    viewNumArray = [NSMutableArray array];
    vcsArray = [NSMutableArray array];
    vcsTagArray = [NSMutableArray array];
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
        pagerView = [[NinaBaseView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT) WithSelectColor:_selectColor WithUnselectorColor:_unselectColor WithUnderLineColor:_underlineColor WithtopTabColor:_topTabColor WithTopTabType:pagerStyle];
        pagerView.titleArray = myArray;
        [pagerView addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
        if (defaultPage > 0) {
            pagerView.scrollView.contentOffset = CGPointMake(FUll_VIEW_WIDTH * defaultPage, 0);
        }
        [self addSubview:pagerView];
        //First ViewController present to the screen
        if (classArray.count > 0 && myArray.count > 0) {
            if (LoadWholePage) {
                for (NSInteger i = 0; i< classArray.count; i++) {
                    [self loadWholeOrNotWithTag:i WithMode:1];
                }
            }else {
                [self loadWholeOrNotWithTag:defaultPage WithMode:0];
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
            NSLog(@"It's controller %li",(long)page + 1);
        }
        self.PageIndex = @(page).stringValue;
        if ([self.delegate respondsToSelector:@selector(ninaCurrentPageIndex:)]) {
            [self.delegate ninaCurrentPageIndex:self.PageIndex];
        }
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
        if (!LoadWholePage) {
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
                            NSLog(@"Your Vc%li is not found in this project!",(long)i + 1);
                        }
                    }else {
                        if ([classArray[i] isKindOfClass:[UIViewController class]]) {
                            UIViewController *ctrl = classArray[i];
                            if (ctrl && viewAlloc[i] == NO) {
                                [self createOtherViewControllers:ctrl WithControllerTag:i];
                            }else if (!ctrl) {
                                NSLog(@"Your Vc%li is not found in this project!",(long)i + 1);
                            }
                        }else if ([classArray[i] isKindOfClass:[UIView class]]) {
                            UIView *singleView = classArray[i];
                            singleView.frame = CGRectMake(FUll_VIEW_WIDTH * i, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
                            [pagerView.scrollView addSubview:singleView];
                        }
                    }
                }else if (page == i && i > classArray.count - 1) {
                    NSLog(@"You are not set title%li 's controller.",(long)i + 1);
                }else {
                    /**<  The number of controllers max is 5.   **/
                    if ([self.delegate performSelector:@selector(deallocVCsIfUnnecessary)] && !LoadWholePage && defaultPage == 0) {
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
}

- (void)dealloc {
    [pagerView removeObserver:self forKeyPath:@"currentPage"];
}

/**<  NSCache delegate method，print current dealloc object. **/
- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    if (isDebug) {
        NSLog(@"Dealloc -------> %@", obj);
    }
}

#pragma mark - Private Method
/**
 *  Create first controller or views.
 *
 *  @param ctrl first controller.
 */
- (void)createFirstViewController:(UIViewController *)ctrl {
    firstVC = ctrl;
    ctrl.view.frame = CGRectMake(FUll_VIEW_WIDTH * defaultPage, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
    [pagerView.scrollView addSubview:ctrl.view];
    /**<  Add new test cache   **/
    if (![self.limitControllerCache objectForKey:@(0)]) {
        [self.limitControllerCache setObject:ctrl forKey:@(0)];
    };
    viewAlloc[defaultPage] = YES;
    [vcsArray addObject:ctrl];
    NSString *transString = [NSString stringWithFormat:@"%li",(long)defaultPage];
    [vcsTagArray addObject:transString];
    if (isDebug) {
        NSLog(@"Controller or view %@",transString);
        NSLog(@"Use new created controller or view %@",transString);
    }
    self.PageIndex = @"1";
}

/**
 *  Create other controllers or views.
 *
 *  @param ctrl controllers.
 *  @param i    controller's tag.
 */
- (void)createOtherViewControllers:(UIViewController *)ctrl WithControllerTag:(NSInteger)i {
    [self.viewController addChildViewController:ctrl];
    [vcsArray addObject:ctrl];
    NSString *tagStr = @(i).stringValue;
    [vcsTagArray addObject:tagStr];
    if (isDebug) {
        NSLog(@"Use new created controller or view%li",(long)i + 1);
    }
    /**<  The number of controllers max is 5.   **/
    if ([self.delegate performSelector:@selector(deallocVCsIfUnnecessary)] && !LoadWholePage && defaultPage == 0) {
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
                NSLog(@"Controller or view %li is dealloced",(long)deallocTag + 1);
            }            
            [vcsTagArray removeObjectAtIndex:0];
        }
    }
    ctrl.view.frame = CGRectMake(FUll_VIEW_WIDTH * i, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
    [pagerView.scrollView addSubview:ctrl.view];
    viewAlloc[i] = YES;
}

/**
 *  Load whole page or not.
 *
 *  @param ninaTag Viewcontroller or view tag.
 *  @param mode Load whole page mode.
 */
- (void)loadWholeOrNotWithTag:(NSInteger)ninaTag WithMode:(NSInteger)mode {
    if ([classArray[ninaTag] isKindOfClass:[NSString class]]) {
        NSString *className = classArray[ninaTag];
        Class class = NSClassFromString(className);
        if ([class isSubclassOfClass:[UIViewController class]]) {
            UIViewController *ctrl = class.new;
            if (mode == 0) {
                [self createFirstViewController:ctrl];
            }else {
                [self createOtherViewControllers:ctrl WithControllerTag:ninaTag];
            }
        }else if ([class isSubclassOfClass:[UIView class]]) {
            UIView *singleView =class.new;
            singleView.frame = CGRectMake(FUll_VIEW_WIDTH * ninaTag, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
            [pagerView.scrollView addSubview:singleView];
        }
    }else {
        if ([classArray[ninaTag] isKindOfClass:[UIViewController class]]) {
            UIViewController *ctrl = classArray[ninaTag];
            if (mode == 0) {
                [self createFirstViewController:ctrl];
            }else {
                [self createOtherViewControllers:ctrl WithControllerTag:ninaTag];
            }
        }else if ([classArray[ninaTag] isKindOfClass:[UIView class]]) {
            UIView *singleView = classArray[ninaTag];
            singleView.frame = CGRectMake(FUll_VIEW_WIDTH * ninaTag, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
            [pagerView.scrollView addSubview:singleView];
        }
    }
}

@end
