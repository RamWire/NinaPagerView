//
//  TopTabView.m
//  NinaPagerView
//
//  Created by RamWire on 2016/11/10.
//  Copyright © 2016年 赵富阳. All rights reserved.
//

#import "TopTabView.h"
#import "UIParameter.h"

@interface TopTabView()
@property (strong, nonatomic) UIImageView *leftImage;
@property (strong, nonatomic) UILabel *rightTitle;
@end

@implementation TopTabView {
    NSString *imageName;
    NSString *titleName;
    UIColor *myTitleColor;
}

- (instancetype)initWithLeftImageName:(NSString *)leftImageName WithRightTitle:(NSString *)rightTitleString WithTitleColor:(UIColor *)titleColor {
    if (self = [super init]) {
        imageName = leftImageName;
        titleName = rightTitleString;
        myTitleColor = titleColor;
        [self addSubview:self.leftImage];
        [self addSubview:self.rightTitle];
        [self initUI];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIImageView *)leftImage {
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    }
    return _leftImage;
}

- (UILabel *)rightTitle {
    if (!_rightTitle) {
        _rightTitle = [UILabel new];
        _rightTitle.text = titleName;
        _rightTitle.textAlignment = NSTextAlignmentCenter;
        _rightTitle.textColor = myTitleColor;
        _rightTitle.font = [UIFont systemFontOfSize:14];
    }
    return _rightTitle;
}

#pragma mark - LayOut 
- (void)initUI {
    self.leftImage.frame = CGRectMake(5, 10, 24, 24);
    self.rightTitle.frame = CGRectMake(30, 0, FUll_VIEW_WIDTH / 5 - 30, 44);
}

@end
