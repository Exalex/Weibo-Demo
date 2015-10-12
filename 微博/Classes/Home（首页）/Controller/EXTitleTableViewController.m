//
//  EXTitleTableViewController.m
//  微博
//
//  Created by Alex on 15/10/11.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXTitleTableViewController.h"

@interface EXTitleTableViewController ()

@end

@implementation EXTitleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    }

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"特别关注";
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"密友";
    }else if(indexPath.row == 2){
        cell.textLabel.text = @"全部";
    }
    
    return cell;
}

@end
