//
//  ViewController.m
//  NinaPagerView
//
//  Created by 赵富阳 on 15/11/13.
//  Copyright © 2015年 赵富阳. All rights reserved.
//

#import "ViewController.h"
#import "UIParameter.h"
#import "PagerView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    PagerView *pagerView;
    FirstViewController *firstVC;
    SecondViewController *secondVC;
    ThirdViewController *thirdVC;
    ForthViewController *forthVC;
    FifthViewController *fifthVC;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *myArray = @[
                         @"大连",
                         @"鞍山",
                         @"本溪",
                         @"阜新",
                         @"铁岭",
                         @"沈阳"
                         ];
    
    pagerView = [[PagerView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT)];
    pagerView.titleArray = myArray;
    [pagerView addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:pagerView];

    self.title = @"Nina";

    //不透明
    self.navigationController.navigationBar.translucent = NO;

    firstVC = [[FirstViewController alloc] init];
    firstVC.view.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn - TabbarHeight);
    [pagerView.scrollView addSubview:firstVC.view];
    [self addChildViewController:firstVC];
    [firstVC didMoveToParentViewController:self];

//    secondVC = [[SecondViewController alloc] init];
//    secondVC.view.frame = CGRectMake(FUll_VIEW_WIDTH, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn - TabbarHeight);
//    [self addChildViewController:secondVC];    
//    [pagerView.scrollView addSubview:secondVC.view];
//    [secondVC didMoveToParentViewController:self];
//
//    thirdVC = [[ThirdViewController alloc] init];
//    thirdVC.view.frame = CGRectMake(FUll_VIEW_WIDTH * 2, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn - TabbarHeight);
//    [pagerView.scrollView addSubview:thirdVC.view];
//    [self addChildViewController:thirdVC];
//    [thirdVC didMoveToParentViewController:self];
//
//    forthVC = [[ForthViewController alloc] init];
//    forthVC.view.frame = CGRectMake(FUll_VIEW_WIDTH * 3, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn - TabbarHeight);
//    NSLog(@"%@",forthVC.view);
//    [pagerView.scrollView addSubview:forthVC.view];
//    [self addChildViewController:forthVC];
//    [forthVC didMoveToParentViewController:self];
//    
//    fifthVC = [[FifthViewController alloc] init];
//    fifthVC.view.frame = CGRectMake(FUll_VIEW_WIDTH * 4, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn - TabbarHeight);
//    NSLog(@"%@",forthVC.view);
//    [pagerView.scrollView addSubview:fifthVC.view];
//    [self addChildViewController:fifthVC];
//    [fifthVC didMoveToParentViewController:self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"currentPage"]) {
        
        NSInteger page = [change[@"new"] integerValue];
        NSLog(@"当前页码为:%li",page);
        if (page == 0) {
            if (!firstVC.view) {
                
                firstVC = [[FirstViewController alloc] init];
                firstVC.view.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn);
                [pagerView.scrollView addSubview:firstVC.view];
            }
        }
        
        if (page == 1) {
            if (!secondVC.view) {
                
                secondVC = [[SecondViewController alloc] init];
                secondVC.view.frame = CGRectMake(FUll_VIEW_WIDTH, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn);
                [pagerView.scrollView addSubview:secondVC.view];
            }
        }
        
        if (page == 2) {
            
            if (!thirdVC.view) {
                
                thirdVC = [[ThirdViewController alloc] init];
                thirdVC.view.frame = CGRectMake(FUll_VIEW_WIDTH * 2, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn);
                [pagerView.scrollView addSubview:thirdVC.view];
            }
        }
        
        if (page == 3) {
            
            if (!forthVC.view) {
                
                forthVC = [[ForthViewController alloc] init];
                forthVC.view.frame = CGRectMake(FUll_VIEW_WIDTH * 3, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn);
                [pagerView.scrollView addSubview:forthVC.view];
            }
        }
        
        if (page == 4) {
            
            if (!fifthVC.view) {
                
                fifthVC = [[FifthViewController alloc] init];
                fifthVC.view.frame = CGRectMake(FUll_VIEW_WIDTH * 4, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - PageBtn);
                [pagerView.scrollView addSubview:fifthVC.view];
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
