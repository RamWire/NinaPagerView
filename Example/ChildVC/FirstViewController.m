//
//  FirstViewController.m
//  NinaPagerView
//
//  Created by RamWire on 15/11/13.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#import "FirstViewController.h"
#import "UIParameter.h"
#import "TestViewController.h"

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
//    [self createLabel:@"1"];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
}

#pragma mark - myTableView
- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT) style:UITableViewStylePlain];
    }
    return _myTableView;
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = @"NinaPagerViewTest";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (isDebugging) {
        NSLog(@"点击了控制器1单元格的%li",(long)indexPath.row);
    }    
    TestViewController *testVC = [TestViewController new];
    [self.navigationController pushViewController:testVC animated:YES];
}

@end
