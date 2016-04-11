//
//  ChildBaseViewController.m
//  NinaPagerView
//
//  Created by RamWire on 16/3/23.
//  Copyright © 2016年 赵富阳. All rights reserved.
//

#import "ChildBaseViewController.h"
#import "UIParameter.h"

@interface ChildBaseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ChildBaseViewController {
    NSString *indexTag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)createLabel:(NSString *)yourTitleStr {
    UILabel *middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(FUll_VIEW_WIDTH / 2 - 80, FUll_VIEW_HEIGHT / 2 - 40 - 64 - PageBtn, 160, 80)];
    NSLog(@"加载了控制器%@",yourTitleStr);
    middleLabel.text = [NSString stringWithFormat:@"第%@个视图控制器",yourTitleStr];
    middleLabel.textColor =[UIColor blackColor];
    middleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:middleLabel];
}

- (void)createTableViewFromVC:(NSString *)yourTag {
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    indexTag = yourTag;
}

#pragma mark - myTableView
- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT - PageBtn) style:UITableViewStylePlain];
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
    NSLog(@"点击了控制器%@单元格的%li",indexTag,indexPath.row);
}

@end
