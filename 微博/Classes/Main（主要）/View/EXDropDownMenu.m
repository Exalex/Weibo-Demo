//
//  EXDropDownMenu.m
//  微博
//
//  Created by Alex on 15/10/11.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXDropDownMenu.h"
#import "const.h"
#import "UIView+Extension.h"

@interface EXDropDownMenu()
@property (nonatomic ,weak) UIImageView *containerView;
@end

@implementation EXDropDownMenu

//用来显示具体内容的容器（懒加载）
- (UIImageView *)containerView
{
    if (!_containerView) {
        //添加一个灰色图片控件
        UIImageView *containerView = [[UIImageView alloc]init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.backgroundColor = [UIColor clearColor];
        containerView.width = 217;
        containerView.hight = 217;
        containerView.userInteractionEnabled = YES;//开启交互功能
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}
//重写init方法
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//清除颜色
        self.backgroundColor = [UIColor clearColor];
        [self containerView];

    }
    return self;
}
//返回init方法
+ (instancetype)menu
{
    return [[self alloc]init];

}
//显示方法
- (void)showFrom:(UIView *)from
{
//    1.获得最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
//    2.添加自己倒窗口上
    [window addSubview:self];
//    3.设置尺寸
    self.frame = window.bounds;
//    4.调整灰色图片位置
    //默认情况下，frame是以父控件左上角为坐标原点
    //可以转换坐标原点，改变frame参照点(让from的franme从form的父控件转到window)
    CGRect newFrame = [from.superview convertRect:from.frame toView:window];
    
    self.containerView.y = CGRectGetMaxY(newFrame);
    
    self.containerView.centerX = CGRectGetMidX(newFrame);
    
}

//销毁方法
- (void)dismiss
{
    [self removeFromSuperview];
}
//监听dropDown点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

//通过属性传给set方法UIView，再加到灰色图片上
-(void)setContent:(UIView *)content
{
    _content = content;
    //调整内容位置
    content.x = 10;
    content.y = 15;
//    
//    调整内容的宽度
//    content.width = self.containerView.width - 2 * content.x;
    
    //设置灰色图片的高度
    self.containerView.hight = CGRectGetMaxY(content.frame) + 11;
    //设置灰色图片的宽度
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;

    //添加内容倒灰色图片中
    [self.containerView addSubview:content];

}

- (void)setContentController:(UIViewController *)contentController
{
    _contentController = contentController;//先引用防止销毁
    
    self.content = contentController.view;
}
@end
