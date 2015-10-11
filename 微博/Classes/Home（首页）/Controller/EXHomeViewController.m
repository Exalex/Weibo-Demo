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

@interface EXHomeViewController ()

@end

@implementation EXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏上的内容
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(friendsearch) image:@"navigationbar_friendsearch" highlightImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(pop) image:@"navigationbar_pop" highlightImage:@"navigationbar_pop_highlighted"];
}

- (void)friendsearch
{
    testViewController *VC = [[testViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)pop
{

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
