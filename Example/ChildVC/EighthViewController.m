//
//  EighthViewController.m
//  NinaPagerView
//
//  Created by RamWire on 16/3/23.
//  Copyright © 2016年 RamWire. All rights reserved.
//

#import "EighthViewController.h"

@interface EighthViewController ()

@end

@implementation EighthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewWillLayoutSubviews {
    [self createTableViewFromVC:@"8"];
}

@end
