//
//  NinaPagerView.m
//  NinaPagerView
//
//  Created by RamWire on 16/3/23.
//  Copyright © 2016年 赵富阳. All rights reserved.
//

#import "NinaPagerView.h"
#import "UIParameter.h"
#import "PagerView.h"
#define MaxNums  10

@implementation NinaPagerView
{
    PagerView *pagerView;
    NSArray *myArray;
    NSArray *classArray;
    NSMutableArray *viewNumArray;
    BOOL viewAlloc[MaxNums];
    BOOL fontChangeColor;
}

- (instancetype)initWithFrame:(CGRect)frame WithTitles:(NSArray *)titles WithVCs:(NSArray *)childVCs {
    if (self = [super initWithFrame:frame]) {
        //Need You Edit,title for the toptabbar
        myArray = titles;
        classArray = childVCs;
    }
    return self;
}

#pragma mark - SetMethod
- (void)setSelectColor:(UIColor *)selectColor {
    _selectColor = selectColor;
    [self initUI];
}
- (void)setUnselectColor:(UIColor *)unselectColor {
    _unselectColor = unselectColor;
   [self initUI];
}
- (void)setUnderlineColor:(UIColor *)underlineColor {
    _underlineColor = underlineColor;
    [self initUI];
}

- (void)initUI {
    if (_underlineColor || _unselectColor || _selectColor) {
        [self createPagerView:myArray WithVCs:classArray];
    }
}

#pragma mark - CreateView
- (void)createPagerView:(NSArray *)titles WithVCs:(NSArray *)childVCs {
    viewNumArray = [NSMutableArray array];
    //No Need to edit
    pagerView = [[PagerView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT) WithSelectColor:_selectColor WithUnselectorColor:_unselectColor WithUnderLineColor:_underlineColor];
    pagerView.titleArray = myArray;
    [pagerView addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    [self addSubview:pagerView];
    //First ViewController present to the screen
    if (classArray.count > 0) {
        NSString *className = classArray[0];
        Class class = NSClassFromString(className);
        if (class) {
            UIViewController *ctrl = class.new;
            ctrl.view.frame = CGRectMake(FUll_VIEW_WIDTH * 0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn);
            [pagerView.scrollView addSubview:ctrl.view];
            viewAlloc[0] = YES;
        }
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"currentPage"]) {
        NSInteger page = [change[@"new"] integerValue];
//        NSLog(@"当前页码为:%li",page);        
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
//            NSLog(@"上方的topTab横向移动了%f",topTabOffsetX);
        }
        for (NSInteger i = 0; i < myArray.count; i++) {
            if (page == i && i <= classArray.count - 1) {
                NSString *className = classArray[i];
                Class class = NSClassFromString(className);
                if (class && viewAlloc[i] == NO) {
                    UIViewController *ctrl = class.new;
                    ctrl.view.frame = CGRectMake(FUll_VIEW_WIDTH * i, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn);
                    [pagerView.scrollView addSubview:ctrl.view];
                    viewAlloc[i] = YES;
                }
            }else if (page == i && i > classArray.count - 1) {
                NSLog(@"您没有配置对应Title的VC");
            }
        }
    }
}

@end
