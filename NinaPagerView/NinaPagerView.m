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

@implementation NinaPagerView
{
    NinaBaseView *pagerView;
    NSArray *myArray;
    NSArray *classArray;
    NSArray *colorArray;
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

#pragma mark - CreateView
- (void)createPagerView:(NSArray *)titles WithVCs:(NSArray *)childVCs WithColors:(NSArray *)colors {
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
                default:
                    break;
            }  
        }
    }
    if (titles.count > 0 && childVCs.count > 0) {
        pagerView = [[NinaBaseView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT) WithSelectColor:_selectColor WithUnselectorColor:_unselectColor WithUnderLineColor:_underlineColor];
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
                    ctrl.view.frame = CGRectMake(FUll_VIEW_WIDTH * i, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn);
                    [pagerView.scrollView addSubview:ctrl.view];
                    viewAlloc[i] = YES;
                }else if (!class) {
                    NSLog(@"您所提供的vc%li类并没有找到。  Your Vc%li is not found in this project!",(long)i + 1,(long)i + 1);
                }
            }else if (page == i && i > classArray.count - 1) {
                NSLog(@"您没有配置对应Title%li的VC",(long)i + 1);
            }
        }
    }
}

- (void)dealloc {
    [pagerView removeObserver:self forKeyPath:@"currentPage"];
}

@end
