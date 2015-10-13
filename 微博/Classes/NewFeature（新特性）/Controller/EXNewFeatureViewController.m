//
//  EXNewFeatureViewController.m
//  微博
//
//  Created by Alex on 15/10/13.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXNewFeatureViewController.h"
#import "UIView+Extension.h"
#import "EXTabBarViewController.h"
#define EXNewfeartureCount 4
@interface EXNewFeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak)  UIPageControl *pageControl;
@property (nonatomic, weak)  UIImageView *imageView;

@end

@implementation EXNewFeatureViewController

int i;

- (void)viewDidLoad {
    [super viewDidLoad];

//    1.创建一个scrollView，显示所有新特性图片
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.contentSize = CGSizeMake(EXNewfeartureCount * scrollView.width, 0);//设置SV滚动范围
    scrollView.bounces = NO;//去除弹簧效果
    scrollView.pagingEnabled = YES;//增加翻页效果
    scrollView.showsHorizontalScrollIndicator = NO;//取消横向指示条
    
    scrollView.delegate = self;//设置代理
    
    [self.view addSubview:scrollView];
    
//    2.添加图片到scrollView中
    for (int i = 0; i < EXNewfeartureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.size = scrollView.size;
        imageView.x = scrollView.width * i;
        imageView.y = scrollView.y;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",i+1]];
        [scrollView addSubview:imageView];
        self.imageView = imageView;
    }
    
    //如果是最后一个imageView，就往里面添加其他内容
    if (i = EXNewfeartureCount - 1) {
        [self setupLastImageView:_imageView];
    }

    
//    3.添加pageControl：分页，展示目前看的是第几页
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = EXNewfeartureCount;                //设置page有几页
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:189 green:189 blue:189 alpha:1];                                                  //点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];//当前页点的颜色
    pageControl.userInteractionEnabled = NO;
    
    pageControl.width = 100;
    pageControl.hight = 100;
    pageControl.centerX = scrollView.width * 0.5;
    pageControl.centerY = scrollView.hight - 50;
    
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;

}
#pragma mark - scrollView的代理方法

//监听scrollView的滚动情况的代理方法（设置小圆点）
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;  //内容偏移量除以宽度
  
    self.pageControl.currentPage = (int)(page + 0.5);//四舍五入（page＋0.5然后强转整数）

}
//初始化最后一个imageView
- (void)setupLastImageView:(UIImageView *)imageView
{
      //开启父控件imageView的交互功能
    imageView.userInteractionEnabled = YES;
    
//1.分享给大家（checkbox）－button实现
    UIButton *shareBtn = [[UIButton alloc]init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 200;
    shareBtn.hight = 30;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.hight * 0.65;
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);//内边距离（切左10 ）
    [shareBtn addTarget:self action:@selector(shareClicked:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    
//    2.开始微博按钮
    UIButton *startBtn = [[UIButton alloc]init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateSelected];
    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageView.hight * 0.75;
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(shareClicked) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
    
}

- (void)shareClicked:(UIButton *)shareBtn
{   //状态取反,切换button选中状态（修改选中图片状态）
    shareBtn.selected = !shareBtn.isSelected;
    
}

- (void)shareClicked
{
    //切换到tabBarController 1.push 2.modal 3.切换window的rootViewController
    //1.拿到widdow
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[EXTabBarViewController alloc]init];
    
}
@end
