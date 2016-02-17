//
//  PagerView.h
//  NinaPagerView
//
//  Created by 赵富阳 on 15/9/22.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopTabView.h"

@interface PagerView : UIView <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *topTab;

//@property (assign, nonatomic) NSInteger titleNum; /**<  标题数量   **/
@property (assign, nonatomic) NSInteger currentPage; /**<  页码   **/
@property (strong, nonatomic) NSArray *titleArray; /**<  标题   **/

//- (instancetype)initWithFrame:(CGRect)frame WithSectionNameArray:(NSArray *)nameArray;

@end
