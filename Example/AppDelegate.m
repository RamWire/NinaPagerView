//
//  AppDelegate.m
//  NinaPagerView
//
//  Created by RamWire on 15/11/13.
//  Copyright © 2015年 RamWire. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    self.window = window;
    [self.window makeKeyAndVisible];
    ViewController *viewC = [[ViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewC];
    navController.navigationBar.translucent = NO;
    self.window.rootViewController = navController;
    //For test
//    navController.navigationBarHidden = YES;
//    UITabBarController *tab = [UITabBarController new];
//    tab.viewControllers = @[navController];
//    self.window.rootViewController = tab;
    return YES;
}

@end
