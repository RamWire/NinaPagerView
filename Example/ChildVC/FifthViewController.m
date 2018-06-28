//
//  FifthViewController.m
//  NinaPagerView
//
//  Created by RamWire on 15/11/16.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#import "FifthViewController.h"
#import "UIParameter.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
}

- (void)viewWillLayoutSubviews {
    [self createTableViewFromVC:@"5"];
}

@end
