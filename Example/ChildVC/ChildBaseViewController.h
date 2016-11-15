//
//  ChildBaseViewController.h
//  NinaPagerView
//
//  Created by RamWire on 16/3/23.
//  Copyright © 2016年 RamWire. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollHiddenDelegate <NSObject>

@optional
- (void)upScrollAction:(BOOL)show;

@end

@interface ChildBaseViewController : UIViewController

- (void)createLabel:(NSString *)yourTitleStr;
- (void)createTableViewFromVC:(NSString *)yourTag;

@property (nonatomic, weak)id<ScrollHiddenDelegate> upScrollDelegate;

@end
