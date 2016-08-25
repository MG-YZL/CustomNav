//
//  UILabel+Action.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/28.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Action)

- (void)setAttributedString:(NSString *)string
                 rangeArray:(NSArray *)rangeArray
                      color:(UIColor *)color;

@end
