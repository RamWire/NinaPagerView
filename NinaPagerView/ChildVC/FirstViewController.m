//
//  FirstViewController.m
//  NinaPagerView
//
//  Created by 赵富阳 on 15/11/13.
//  Copyright © 2015年 赵富阳. All rights reserved.
//

#import "FirstViewController.h"
#import "UIParameter.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    NSLog(@"加载了控制器1");
    
    UILabel *middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(FUll_VIEW_WIDTH / 2 - 80, FUll_VIEW_HEIGHT / 2 - 40 - 64 - PageBtn, 160, 80)];
    middleLabel.text = @"第一个视图控制器";
    middleLabel.textColor =[UIColor blackColor];
    middleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:middleLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
