//
//  ViewController.m
//  NinaPagerView
//
//  Created by 赵富阳 on 15/11/13.
//  Copyright © 2015年 赵富阳. All rights reserved.
//

#import "ViewController.h"
#import "UIParameter.h"
#import "NinaPagerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nina";
    //不透明
    self.navigationController.navigationBar.translucent = NO;
    //Need You Edit
    NSArray *myArray =   @[
                                                  @"大连市",
                                                  @"甘井子",
                                                  @"星海广场",
                                                  @"西岗",
                                                  @"马栏子",
                                                  @"革镇堡",
                                                  @"中山",
                                                  @"人民广场",
                                                  @"中山广场"
                                                  ];
    NSArray *classArray = @[
                                                   @"FirstViewController",
                                                   @"SecondViewController",
                                                   @"ThirdViewController",
                                                   @"ForthViewController",
                                                   @"FifthViewController",
                                                   @"SixthViewController",
                                                   @"SeventhViewController",
                                                   @"EighthViewController",
                                                   @"NinthViewController",
                                                   ];
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT) WithTitles:myArray WithVCs:classArray];
    [self.view addSubview:ninaPagerView];
}

@end
