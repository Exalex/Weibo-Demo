//
//  AppDelegate.m
//  微博
//
//  Created by Alex on 15/10/9.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "AppDelegate.h"
#import "const.h"
#import "EXHomeViewController.h"
#import "EXMessageCenterViewController.h"
#import "EXDiscoverViewController.h"
#import "EXProfileViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//  1.创建窗口
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
//  2.设置根控制器
    UITabBarController *tabbarVc = [[UITabBarController alloc]init];
    self.window.rootViewController = tabbarVc;
    [self.window makeKeyAndVisible];
//  3.设置tabbar的子控制器
    EXHomeViewController *home = [[EXHomeViewController alloc]init];
    [self addchildVc:home WithTitle:@"首页" image:@"tabbar_home" selectImage:@"tabbar_home_select"];
    EXMessageCenterViewController *messageCenter = [[EXMessageCenterViewController alloc]init];
    [self addchildVc:messageCenter WithTitle:@"消息" image:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected"];
    EXDiscoverViewController *discover = [[EXDiscoverViewController alloc]init];
    [self addchildVc:discover WithTitle:@"发现" image:@"tabbar_discover" selectImage:@"tabbar_discover_selected"];
    EXProfileViewController *profile = [[EXProfileViewController alloc]init];
    [self addchildVc:profile WithTitle:@"我" image:@"tabbar_profile" selectImage:@"tabbar_home_select"];
    
    
//把创建的view加入tabBarController
    tabbarVc.viewControllers = @[home,messageCenter,discover,profile];
    //另一种写法[tabbarVc addChildViewController:v1];

    
 /**如果有很多重复代码－》将重复代码抽取到一个方法中
    1.相同代码抽取的一个方法中
    2.不同的东西变成参数
    3.在使用到这段代码的这个地方调用方法，传递参数*/
    
    return YES;
}

- (void)addchildVc:(UIViewController *)childVc WithTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    //设置子控制器的文字和图片
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
    //设置文字的样式
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName] = EXColor(123, 123, 123);
    
    NSMutableDictionary *selectedtextAttributes = [NSMutableDictionary dictionary];
    selectedtextAttributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [childVc.tabBarItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedtextAttributes forState:UIControlStateSelected];
    
    childVc.view.backgroundColor = EXRandomColor;
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
