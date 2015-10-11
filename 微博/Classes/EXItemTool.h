//
//  EXItemTool.h
//  微博
//
//  Created by Alex on 15/10/10.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EXItemTool : NSObject
+ (UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage;
@end
