//
//  TopTabView.m
//  一两理财
//
//  Created by 赵富阳 on 15/10/13.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#import "TopTabView.h"
#import "UIParameter.h"

@implementation TopTabView {
    
    CGFloat pageBtnHeight;
    
}

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withTitleColor:(UIColor *)titleColor withUnselectedImage:(NSString *)unselectedImage withSelectedImage:(NSString *)selectedImage  {
    
    if (self = [super initWithFrame:frame]) {
        
        self.frame = frame;
        
        //传入的title内容和颜色
        self.title.text = title;
        self.title.textColor = titleColor;
        
        //传入选中和未选中的图片
        self.unselectedImage.image = [UIImage imageNamed:unselectedImage];
        self.selectedImage.image = [UIImage imageNamed:selectedImage];
        
        [self addSubview:self.unselectedImage];
        [self addSubview:self.selectedImage];
        [self addSubview:self.title];
   
    }
    
    return self;
    
}

- (UIImageView *)unselectedImage {
    
    if (!_unselectedImage) {
        
        _unselectedImage = [[UIImageView alloc] init];
    }
    
    return _unselectedImage;
}


- (UIImageView *)selectedImage {
    
    if (!_selectedImage) {
        
        _selectedImage = [[UIImageView alloc] init];
    }
    
    return _selectedImage;
}

- (UILabel *)title {
    
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:15];
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [self initUI];
    
}


- (void)initUI {
    
    _unselectedImage.frame = CGRectMake((.12 * self.frame.size.width), TotalY, LeftLength, LeftLength);
    _selectedImage.frame = CGRectMake((.12 * self.frame.size.width), TotalY, LeftLength, LeftLength);
    _title.frame = CGRectMake((.12 * self.frame.size.width) + LeftLength + 4, 0, TitleWidth, PageBtn);

}


@end
