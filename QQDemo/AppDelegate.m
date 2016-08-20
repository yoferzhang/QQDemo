//
//  AppDelegate.m
//  QQDemo
//
//  Created by yoferzhang on 16/8/20.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import "AppDelegate.h"
#import "DynamicViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建并初始化 UITabBarController
    UITabBarController *mainTabBarController = [[UITabBarController alloc] init];
    
    // 初始化3个视图控制器
    DynamicViewController *dynamicViewController = [[DynamicViewController alloc] init];
    ContactViewController *contactViewController = [[ContactViewController alloc] init];
    MessageViewController *messageViewController = [[MessageViewController alloc] init];
    
    // 为 3 个视图控制器添加导航栏控制器
    UINavigationController *messageNavigationViewController = [[UINavigationController alloc] initWithRootViewController:messageViewController];
    UINavigationController *contactNavigationViewController = [[UINavigationController alloc] initWithRootViewController:contactViewController];
    UINavigationController *dynamicNavigationViewController = [[UINavigationController alloc] initWithRootViewController:dynamicViewController];
    
    
    
    // 设置 3 个tabbar 的字体和图片
    messageNavigationViewController.title = @"消息";
    contactNavigationViewController.title = @"联系人";
    dynamicNavigationViewController.title = @"动态";
    
    
    
    // 创建一个数组包含 3 个导航栏控制器
    NSArray *controllers = @[messageNavigationViewController, contactNavigationViewController, dynamicNavigationViewController];
    
    // 将数组传给 UITabBarController
    mainTabBarController.viewControllers = controllers;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSLog(@"%f, %f", self.window.frame.size.width, self.window.frame.size.height);
    self.window.rootViewController = mainTabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
