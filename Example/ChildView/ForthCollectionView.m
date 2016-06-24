//
//  ForthCollectionView.m
//  NinaPagerView
//
//  Created by RamWire on 16/6/22.
//  Copyright © 2016年 赵富阳. All rights reserved.
//

#import "ForthCollectionView.h"
#import "UIParameter.h"
static NSString *identy = @"collectionCell";

@implementation ForthCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor whiteColor];
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identy];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identy forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

//单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(FUll_VIEW_WIDTH, 80);
}

@end
