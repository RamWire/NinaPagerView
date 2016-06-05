//
//  SecondViewController.m
//  NinaPagerView
//
//  Created by RamWire on 15/11/13.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#import "SecondViewController.h"
#import "UIParameter.h"

@interface SecondViewController ()
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
//    [self createLabel:@"2"];
    [self createTableViewFromVC:@"2"];
}

@end
