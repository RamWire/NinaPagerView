//
//  FirstTableView.m
//  NinaPagerView
//
//  Created by RamWire on 16/3/28.
//  Copyright © 2016年 赵富阳. All rights reserved.
//

#import "FirstTableView.h"

@implementation FirstTableView {
    UITableViewCell *cells;
    NSInteger yourNum;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self _createViews];
        //协议一定要写！
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (void)_createViews {
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableView delegate
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = @"NinaPagerView";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

@end
