//
//  ThirdViewController.m
//  NinaPagerView
//
//  Created by 赵富阳 on 15/11/13.
//  Copyright © 2015年 赵富阳. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIParameter.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
//    [self createLabel:@"3"];
    [self createTableViewFromVC:@"3"];
}

@end
