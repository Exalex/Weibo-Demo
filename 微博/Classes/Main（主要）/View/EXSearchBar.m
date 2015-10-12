//
//  EXSearchBar.m
//  微博
//
//  Created by Alex on 15/10/11.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "EXSearchBar.h"
#import "UIView+Extension.h"

@implementation EXSearchBar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"输入您感兴趣的内容";
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        //设置左边放大镜图标
        UIImageView *searchIcon = [[UIImageView alloc]init];
        searchIcon.image =  [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width = 30;
        searchIcon.hight = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc]init];
}


@end
