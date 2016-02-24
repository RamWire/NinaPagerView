//
//  ForthViewController.m
//  NinaPagerView
//
//  Created by 赵富阳 on 15/11/13.
//  Copyright © 2015年 赵富阳. All rights reserved.
//

#import "ForthViewController.h"
#import "UIParameter.h"

@interface ForthViewController ()

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"加载了控制器4");
    
    UILabel *middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(FUll_VIEW_WIDTH / 2 - 80, FUll_VIEW_HEIGHT / 2 - 40 - 64 - PageBtn, 160, 80)];
    middleLabel.text = @"第四个视图控制器";
    middleLabel.textColor =[UIColor blackColor];
    middleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:middleLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
