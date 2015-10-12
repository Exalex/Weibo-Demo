//
//  EXTabBarViewController.m
//  微博
//
//  Created by Alex on 15/10/10.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXTabBarViewController.h"
#import "const.h"
#import "EXHomeViewController.h"
#import "EXMessageCenterViewController.h"
#import "EXDiscoverViewController.h"
#import "EXProfileViewController.h"
#import "EXNavigationController.h"
#import "UIView+Extension.h"
#import "EXTabBar.h"

@interface EXTabBarViewController ()<EXTabBarDelegete>

@end

@implementation EXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化子控制器
    EXHomeViewController *home = [[EXHomeViewController alloc]init];
    [self addchildVc:home WithTitle:@"首页" image:@"tabbar_home" selectImage:@"tabbar_home_select"];
    EXMessageCenterViewController *messageCenter = [[EXMessageCenterViewController alloc]init];
    [self addchildVc:messageCenter WithTitle:@"消息" image:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected"];
    EXDiscoverViewController *discover = [[EXDiscoverViewController alloc]init];
    [self addchildVc:discover WithTitle:@"发现" image:@"tabbar_discover" selectImage:@"tabbar_discover_selected"];
    EXProfileViewController *profile = [[EXProfileViewController alloc]init];
    [self addchildVc:profile WithTitle:@"我" image:@"tabbar_profile" selectImage:@"tabbar_home_select"];
    
//替换成自定义重写过的tabbar
//self.tabBar = [[EXTabBar alloc]init];
    EXTabBar *tabBar = [[EXTabBar alloc]init];
    tabBar.delegate = self;
    
    [self setValue:[[EXTabBar alloc]init] forKeyPath:@"tabBar"];
    
    
    //把创建的view加入tabBarController
    //    tabbarVc.viewControllers = @[home,messageCenter,discover,profile];
   
  /**如果有很多重复代码－》将重复代码抽取到一个方法中
     1.相同代码抽取的一个方法中
     2.不同的东西变成参数
     3.在使用到这段代码的这个地方调用方法，传递参数  */

}

//添加一个子控制器
//childVc：子控制器 title：标题 image：图片 selectedImage：选中的图片
- (void)addchildVc:(UIViewController *)childVc WithTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
//设置子控制器的文字和图片
    //childVc.tabBarItem.title = title;
    //childVc.navigationItem.title = title;
    childVc.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//设置文字的样式
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName] = EXColor(123, 123, 123);
    
    NSMutableDictionary *selectedtextAttributes = [NSMutableDictionary dictionary];
    selectedtextAttributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [childVc.tabBarItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedtextAttributes forState:UIControlStateSelected];
    
//    childVc.view.backgroundColor = EXRandomColor;
//先给外面传进来的小控制器 包装一个导航控制器
  EXNavigationController *nav = [[EXNavigationController alloc]initWithRootViewController:childVc];
    
//添加子控制器：把创建的view加入tabBarController
    //tabbarVc.viewControllers = @[home,messageCenter,discover,profile];
     [self addChildViewController:nav];
}
#pragma mark - EXTabBarDelegete代理方法
- (void)tabBarDidClickPlusButton:(EXTabBar *)tabBar
{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    [self presentViewController:vc animated:YES completion:nil];

}


@end
