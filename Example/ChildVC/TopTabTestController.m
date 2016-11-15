//
//  TopTabTestController.m
//  NinaPagerView
//
//  Created by RamWire on 2016/11/15.
//  Copyright © 2016年 赵富阳. All rights reserved.
//

#import "TopTabTestController.h"
#import "UIParameter.h"
#import "TestViewController.h"

@interface TopTabTestController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation TopTabTestController {
    CGFloat offsetY;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableViewFromVC];
}

#pragma mark - Private Method
- (void)createTableViewFromVC {
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
        cell.textLabel.text = @"NinaPagerView";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestViewController *testVC = [TestViewController new];
    [self.navigationController pushViewController:testVC animated:YES];
}

- (void)testAction {
    if (isDebugging) {
        NSLog(@"测试点击事件");
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.upScrollDelegate respondsToSelector:@selector(upScrollAction:)]) {
        if (scrollView.contentOffset.y > 0) {
            if (scrollView.contentOffset.y > offsetY) {
                [self.upScrollDelegate upScrollAction:NO];
            }
            if (scrollView.contentOffset.y < offsetY && scrollView.contentOffset.y < PageBtn) {
                [self.upScrollDelegate upScrollAction:YES];
            }
        }else {
            [self.upScrollDelegate upScrollAction:YES];
        }
    }
    offsetY = scrollView.contentOffset.y;
}

@end
