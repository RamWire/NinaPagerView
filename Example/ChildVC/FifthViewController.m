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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
//    [self createLabel:@"5"];
    [self createTableViewFromVC:@"5"];
}

@end
