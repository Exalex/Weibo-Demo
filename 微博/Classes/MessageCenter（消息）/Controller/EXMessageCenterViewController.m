//
//  EXMessageCenterViewController.m
//  微博
//
//  Created by Alex on 15/10/10.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXMessageCenterViewController.h"
#import "EXtextViewController.h"

@interface EXMessageCenterViewController ()

@end

@implementation EXMessageCenterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //添加一个item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"写私信" style:UIBarButtonItemStylePlain target:self action:@selector(composeMsg)];
    //设置item为disable
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    

}

- (void)composeMsg
{
    NSLog(@"发送信息中");

}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%d行",indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   //创建控制器
    EXtextViewController *test = [[EXtextViewController alloc]init];
    test.title = @"控制器1";
    //当test控制器被push时，test1所在tabbarcontroller的tabbar会自动隐藏
    test.hidesBottomBarWhenPushed = YES;
    //跳转方法
    [self.navigationController pushViewController:test animated:YES];
    

}
@end
