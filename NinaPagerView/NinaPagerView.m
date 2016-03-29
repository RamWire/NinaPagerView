//
//  NinaPagerView.m
//  NinaPagerView
//
//  Created by RamWire on 16/3/23.
//  Copyright © 2016年 赵富阳. All rights reserved.
//

#import "NinaPagerView.h"
#import "UIParameter.h"
#import "NinaBaseView.h"
#define MaxNums  10

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
            NSString *className = classArray[0];
            Class class = NSClassFromString(className);
            if (class) {
                UIViewController *ctrl = class.new;
                ctrl.view.frame = CGRectMake(FUll_VIEW_WIDTH * 0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
                [pagerView.scrollView addSubview:ctrl.view];
                viewAlloc[0] = YES;
                [vcsArray addObject:ctrl];
                [vcsTagArray addObject:@"0"];
//                UIView *view = class.new;
//                view.frame = CGRectMake(FUll_VIEW_WIDTH * 0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
//                [pagerView.scrollView addSubview:view];
//                viewAlloc[0] = YES;
            }
        }
    }else {
        NSLog(@"You should correct titlesArray or childVCs count!");
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"currentPage"]) {
        NSInteger page = [change[@"new"] integerValue];
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
                NSString *className = classArray[i];
                Class class = NSClassFromString(className);
                if (class && viewAlloc[i] == NO) {
                    UIViewController *ctrl = class.new;
                    [vcsArray addObject:ctrl];
                    NSString *tagStr = @(i).stringValue;
                    [vcsTagArray addObject:tagStr];
                     /**<  内存管理限制控制器最大数量为5个   **/
                    if (vcsArray.count > 5) {
                        UIViewController *deallocVC = [vcsArray firstObject];
                        [deallocVC.view removeFromSuperview];
                        deallocVC.view = nil;
                        deallocVC = nil;
                        [vcsArray removeObjectAtIndex:0];
                        NSInteger deallocTag = [[vcsTagArray firstObject] integerValue];
                        viewAlloc[deallocTag] = NO;
                        NSLog(@"控制器%li没了",(long)deallocTag + 1);
                        [vcsTagArray removeObjectAtIndex:0];
                    }
                    ctrl.view.frame = CGRectMake(FUll_VIEW_WIDTH * i, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
                    [pagerView.scrollView addSubview:ctrl.view];
                    viewAlloc[i] = YES;
//                    UIView *view = class.new;
//                    view.frame = CGRectMake(FUll_VIEW_WIDTH * i, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
//                    [pagerView.scrollView addSubview:view];
//                    viewAlloc[i] = YES;
                }else if (!class) {
                    NSLog(@"您所提供的vc%li类并没有找到。  Your Vc%li is not found in this project!",(long)i + 1,(long)i + 1);
                }
            }else if (page == i && i > classArray.count - 1) {
                NSLog(@"您没有配置对应Title%li的VC",(long)i + 1);
            }else {
                /**<  内存管理限制控制器最大数量为5个   **/
                if (vcsArray.count > 5) {
                    UIViewController *deallocVC = [vcsArray firstObject];
                    [deallocVC.view removeFromSuperview];
                    deallocVC.view = nil;
                    deallocVC = nil;
                    [vcsArray removeObjectAtIndex:0];
                    NSInteger deallocTag = [[vcsTagArray firstObject] integerValue];
                    viewAlloc[deallocTag] = NO;
                    [vcsTagArray removeObjectAtIndex:0];
                }
            }
        }
    }
}

- (void)dealloc {
    [pagerView removeObserver:self forKeyPath:@"currentPage"];
}

/**
 *  NSCache的代理方法，打印当前清除对象 */
- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    //[NSThread sleepForTimeInterval:0.5];
    
    NSLog(@"清除了-------> %@", obj);
}

@end
