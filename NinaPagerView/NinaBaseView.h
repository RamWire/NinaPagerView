//
//  PagerView.h
//  NinaPagerView
//
//  Created by 赵富阳 on 15/9/22.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopTabView.h"

@interface NinaBaseView : UIView <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (assign, nonatomic) NSInteger currentPage; /**<  页码   **/
@property (strong, nonatomic) UIScrollView *topTab; /**<  顶部tab   **/
@property (strong, nonatomic) NSArray *titleArray; /**<  标题   **/

- (instancetype)initWithFrame:(CGRect)frame WithSelectColor:(UIColor *)selectColor WithUnselectorColor:(UIColor *)unselectColor WithUnderLineColor:(UIColor *)underlineColor WithtopTabColor:(UIColor *)topTabColor;
@end
