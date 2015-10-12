//
//  AppDelegate.m
//  微博
//
//  Created by Alex on 15/10/9.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "AppDelegate.h"
#import "EXTabBarViewController.h"
#import "UIView+Extension.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

UIWindow *window2;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//  1.创建窗口
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
//  2.设置根控制器
    self.window.rootViewController = [[EXTabBarViewController alloc]init];
//  3.显示窗口
    [self.window makeKeyAndVisible];

    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    }

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}
/** 重构抽取前的代码
3.设置tabbar的子控制器
UIViewController *vc1 = [[UIViewController alloc]init];
//arc4random_uniform(11)/10.0  0-1的随机数
vc1.view.backgroundColor = EXRandomColor;
vc1.tabBarItem.title = @"首页";
vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_home_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
textAttributes[NSForegroundColorAttributeName] = EXColor(123, 123, 123);
[vc1.tabBarItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
NSMutableDictionary *selectedtextAttributes = [NSMutableDictionary dictionary];
selectedtextAttributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
[vc1.tabBarItem setTitleTextAttributes:selectedtextAttributes forState:UIControlStateSelected];

UIViewController *vc2 = [[UIViewController alloc]init];
vc2.view.backgroundColor = EXRandomColor;
vc2.tabBarItem.title = @"消息";
vc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_message_center_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

UIViewController *vc3 = [[UIViewController alloc]init];
vc3.view.backgroundColor = EXRandomColor;
vc3.tabBarItem.title = @"发现";
vc3.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
vc3.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discover_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

UIViewController *vc4 = [[UIViewController alloc]init];
vc4.view.backgroundColor = EXRandomColor;
vc4.tabBarItem.title = @"发现";
vc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
vc4.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_profile_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];*/

@end
