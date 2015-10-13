//
//  EXDropDownMenu.h
//  微博
//
//  Created by Alex on 15/10/11.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EXDropDownMenu;

@protocol EXDropDownMenuDelegate <NSObject>
@optional
- (void)dropDownMenuDiddismiss:(EXDropDownMenu *)menu;
@end

@interface EXDropDownMenu : UIView
@property (nonatomic, weak) id<EXDropDownMenuDelegate> delegate;
+ (instancetype)menu;
//显示
- (void)showFrom:(UIView *)from;
//销毁
- (void)dismiss;
//内容
@property (nonatomic, strong) UIView *content;
//内容控制器
@property (nonatomic, strong) UIViewController *contentController;


@end
