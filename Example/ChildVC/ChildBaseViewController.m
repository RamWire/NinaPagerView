//
//  ChildBaseViewController.m
//  NinaPagerView
//
//  Created by RamWire on 16/3/23.
//  Copyright © 2016年 赵富阳. All rights reserved.
//

#import "ChildBaseViewController.h"
#import "UIParameter.h"
#import "FirstTableView.h"

@interface ChildBaseViewController ()

@end

@implementation ChildBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FirstTableView *firstTV = [[FirstTableView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn) style:UITableViewStylePlain];
    [self.view addSubview:firstTV];
}

- (void)createLabel:(NSString *)yourTitleStr {
    UILabel *middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(FUll_VIEW_WIDTH / 2 - 80, FUll_VIEW_HEIGHT / 2 - 40 - 64 - PageBtn, 160, 80)];
    NSLog(@"加载了控制器%@",yourTitleStr);
    middleLabel.text = [NSString stringWithFormat:@"第%@个视图控制器",yourTitleStr];
    middleLabel.textColor =[UIColor blackColor];
    middleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:middleLabel];
}

@end
