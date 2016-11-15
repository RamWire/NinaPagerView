//
//  TopTabTestController.h
//  NinaPagerView
//
//  Created by RamWire on 2016/11/15.
//  Copyright © 2016年 赵富阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollHiddenDelegate <NSObject>

@optional
- (void)upScrollAction:(BOOL)show;

@end

@interface TopTabTestController : UIViewController

@property (nonatomic, weak)id<ScrollHiddenDelegate> upScrollDelegate;

@end
