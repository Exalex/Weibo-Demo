//
//  EXtextViewController.m
//  微博
//
//  Created by Alex on 15/10/10.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXtextViewController.h"
#import "testViewController.h"
#import "UIView+Extension.h"

@interface EXtextViewController ()

@end

@implementation EXtextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    testViewController *VC = [[testViewController alloc]init];
    VC.title = @"ceshi";
    [self.navigationController pushViewController:VC animated:YES];
}
@end