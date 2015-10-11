//
//  EXNavigationController.m
//  微博
//
//  Created by Alex on 15/10/10.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXNavigationController.h"
#import "UIView+Extension.h"
#import "UIBarButtonItem+Extension.h"

@implementation EXNavigationController

+ (void)initialize
{   //设置整个项目所有item的主题样式
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    NSMutableDictionary *itemAttris = [NSMutableDictionary dictionary];
    itemAttris[NSForegroundColorAttributeName] = [UIColor orangeColor];
    itemAttris[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:itemAttris forState:UIControlStateNormal];
    //设置disable下item的主题样式
    NSMutableDictionary *disabledItemAttris = [NSMutableDictionary dictionary];
    disabledItemAttris[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:disabledItemAttris forState:UIControlStateDisabled];
}

// 重写push方法来自定义导航控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {//这是push进来的不是（第一个子）根控制器
        viewController.hidesBottomBarWhenPushed = YES;//自动隐藏子控制器底栏
        
    viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(back)  image:@"navigationbar_back" highlightImage:@"navigationbar_back_highlighted"];
        
    viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(more) image:@"navigationbar_more" highlightImage:@"navigationbar_more_highlighted"];
        }
    //重写方法需先调用父类方法
    [super pushViewController:viewController animated:animated];
}

- (void)back
{   //pop掉此层view
    //是self 非self.navigationController
    //本来就是个navigationController
    [self popViewControllerAnimated:YES];
}
- (void)more
{   //pop根控制器
    [self popToRootViewControllerAnimated:YES];
}

@end
