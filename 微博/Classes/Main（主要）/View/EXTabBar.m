//
//  EXTabBar.m
//  微博
//
//  Created by Alex on 15/10/12.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXTabBar.h"
#import "UIView+Extension.h"
@interface EXTabBar()
@property (nonatomic, strong) UIButton *plusBtn;

@end
@implementation EXTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //    2.添加一个按钮倒tabbar中
        UIButton *plusBtn = [[UIButton alloc]init];
        
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateSelected];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        
        self.plusBtn = plusBtn;
    }
    return self;
}

//加号按钮点击
- (void)plusClick
{
//    通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}



//重写layout
-(void)layoutSubviews
{
    [super layoutSubviews];
    
//    1.设置加号按钮的位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.hight * 0.5;
//    2.设置其他tabBarButton的尺寸
    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    int count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        UIView *child = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            //设置宽度
            child.width = tabbarButtonW;
            //设置x坐标
            child.x = tabbarButtonIndex * tabbarButtonW;
            //增加索引
            tabbarButtonIndex ++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex ++;
            }
        }}
}
@end
