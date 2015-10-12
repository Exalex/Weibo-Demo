//
//  EXTabBar.h
//  微博
//
//  Created by Alex on 15/10/12.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EXTabBar;

@protocol EXTabBarDelegete <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(EXTabBar *)tabBar;
@end

@interface EXTabBar : UITabBar
@property (nonatomic, weak) id<EXTabBarDelegete> delegate;
@end
