//
//  FirstViewController.m
//  NinaPagerView
//
//  Created by 赵富阳 on 15/11/13.
//  Copyright © 2015年 赵富阳. All rights reserved.
//

#import "FirstViewController.h"
#import "UIParameter.h"
#import "FirstTableView.h"

@interface FirstViewController ()
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    FirstTableView *firstTV = [[FirstTableView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn) style:UITableViewStylePlain];
    [self.view addSubview:firstTV];
}

@end
