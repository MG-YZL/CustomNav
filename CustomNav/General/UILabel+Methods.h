//
//  UILabel+Methods.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/28.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Methods)
/**
 *  让label上的字符串的字体颜色发生变化
 *
 *  @param string     label上的字符串
 *  @param rangeArray 需要变化的字符串范围
 *  @param color      颜色值
 */

//- (void)setAttributedString:(NSString *)string
//                 rangeArray:(NSArray *)rangeArray
//                      color:(UIColor *)color;


/**
 *  让label上的字符串的字体颜色发生变化
 *
 *  @param changeStr 需要变化的字符串
 *  @param color     颜色值
 */
- (void)setAttributedChangeStr:(NSString *)changeStr
                         color:(UIColor *)color;
//- (CGSize)getWidthWithFont:(UIFont *)font height:(float)height;
- (void)setLabelTextAttributeWithBeginLoaction:(NSInteger)begin endLocation:(NSInteger)end fontName:(NSString *)fontName fontSize:(CGFloat)fontSize;
@end

