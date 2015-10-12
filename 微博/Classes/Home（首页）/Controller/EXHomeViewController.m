//
//  EXHomeViewController.m
//  微博
//
//  Created by Alex on 15/10/10.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXHomeViewController.h"
#import "UIView+Extension.h"
#import "testViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
#import "EXSearchBar.h"
#import "const.h"
#import "EXTitleTableViewController.h"
#import "EXDropDownMenu.h"
@interface EXHomeViewController ()

@end

@implementation EXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏上的内容
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(friendsearch) image:@"navigationbar_friendsearch" highlightImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(pop) image:@"navigationbar_pop" highlightImage:@"navigationbar_pop_highlighted"];
    
    
    //添加首页中间的标题按钮
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    titleBtn.width = 150;
    titleBtn.hight = 30;
//    titleBtn.backgroundColor = EXRandomColor;
    
    //设置按钮的文字和图片
    [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    titleBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 80, 0, 0);
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    //监听标题点击
    [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleBtn;
}

- (void)friendsearch
{
    testViewController *VC = [[testViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)pop
{

}

- (void)titleClick:(UIButton *)titleButton
{
//   1.创建下拉菜单
   EXDropDownMenu *menu = [EXDropDownMenu menu];
    
//   2.通过content属性传给dropDownMenu任何UIView或ViewController
    EXTitleTableViewController *vc = [[EXTitleTableViewController alloc]init];
    vc.view.hight = 200;
    vc.view.width = 200;
    menu.contentController = vc;
    
//   3.显示下拉菜单
    [menu showFrom:titleButton];

    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

@end
