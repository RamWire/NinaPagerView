//
//  PagerView.m
//  NinaPagerView
//
//  Created by 赵富阳 on 15/9/22.
//  Copyright © 2015年 renrunkeji. All rights reserved.
//

#import "PagerView.h"
#import "TopTabView.h"

@implementation PagerView {
    
    UIView *lineBottom;
//    NSInteger currentPage;
    UIView *topTabBottomLine;
    NSMutableArray *btnArray;
    NSArray *titlesArray; /**<  标题   **/
    NSInteger arrayCount; /**<  topTab数量   **/
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

#pragma mark - SetMethod
- (void)setTitleArray:(NSArray *)titleArray {
    
    titlesArray = titleArray;
    arrayCount = titleArray.count;
    self.topTab.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, PageBtn);
    self.scrollView.frame = CGRectMake(0, PageBtn, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn - TabbarHeight);
    [self addSubview:self.topTab];
    [self addSubview:self.scrollView];
}

#pragma mark - GetMethod
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = UIColorFromRGB(0xfafafa);
        _scrollView.contentSize = CGSizeMake(FUll_VIEW_WIDTH * titlesArray.count, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.alwaysBounceHorizontal = YES;
        
    }
    return _scrollView;
}

- (UIView *)topTab {
    
    if (!_topTab) {
        
        _topTab = [[UIView alloc] init];
        
        btnArray = [NSMutableArray array];
        
        for (NSInteger i = 0; i < titlesArray.count; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//            [button setTitle:titleArray[i] forState:UIControlStateNormal];
//            TopTabView *topTabView = [[TopTabView alloc] initWithFrame:CGRectMake(FUll_VIEW_WIDTH / titleArray.count * i, 0, FUll_VIEW_WIDTH / titleArray.count, PageBtn) withTitle:titleArray[i] withTitleColor:[UIColor grayColor] withUnselectedImage:nil withSelectedImage:nil];
//            [button addSubview:topTabView];
            button.tag = i;
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitle:titlesArray[i] forState:UIControlStateNormal];
            button.frame = CGRectMake(FUll_VIEW_WIDTH / titlesArray.count * i, 0, FUll_VIEW_WIDTH / titlesArray.count, PageBtn);
            [_topTab addSubview:button];
            [button addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
            [btnArray addObject:button];
            
            if (i == 0) {
                
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
            } else {
                
                [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                
            }
            
        }
        
        topTabBottomLine = [[UIView alloc] init];
        topTabBottomLine.backgroundColor = UIColorFromRGB(0xcecece);
        [_topTab addSubview:topTabBottomLine];
        
        
        lineBottom = [[UIView alloc] init];
        lineBottom.backgroundColor = UIColorFromRGB(0xff6262);
        [_topTab addSubview:lineBottom];
        
    }
    
    return _topTab;
}

#pragma mark - BtnMethod
- (void)touchAction:(UIButton *)button {
    
    [_scrollView setContentOffset:CGPointMake(FUll_VIEW_WIDTH * button.tag, 0) animated:YES];
    self.currentPage = (FUll_VIEW_WIDTH * button.tag + FUll_VIEW_WIDTH / 2) / FUll_VIEW_WIDTH;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    self.currentPage = (NSInteger)((scrollView.contentOffset.x + FUll_VIEW_WIDTH / 2) / FUll_VIEW_WIDTH);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger yourPage = (NSInteger)((scrollView.contentOffset.x + FUll_VIEW_WIDTH / 2) / FUll_VIEW_WIDTH);
    
    CGFloat yourCount = 1.0 / arrayCount;
    lineBottom.frame = CGRectMake(scrollView.contentOffset.x/ arrayCount, PageBtn - 2, yourCount * FUll_VIEW_WIDTH, 1);
    
    for (NSInteger i = 0;  i < btnArray.count; i++) {
        
        [btnArray[i] setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    
    [btnArray[yourPage] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


#pragma mark - LayOutSubViews
- (void)layoutSubviews {
    
    [super layoutSubviews];
    [self initUI];
    
}

- (void)initUI {
    
    CGFloat yourCount = 1.0 / arrayCount;
    lineBottom.frame = CGRectMake(0, PageBtn - 2,yourCount * FUll_VIEW_WIDTH, 2);
    topTabBottomLine.frame = CGRectMake(0, PageBtn - 1, FUll_VIEW_WIDTH, 1);
    
}

@end
