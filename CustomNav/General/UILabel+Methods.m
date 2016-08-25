//
//  UILabel+Methods.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/28.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "UILabel+Methods.h"

@implementation UILabel (Methods)
/**
 *  让label上的字符串的字体颜色发生变化
 *
 *  @param string     label上的字符串
 *  @param rangeArray 需要变化的字符串范围
 *  @param color      颜色值
 */
//- (void)setAttributedString:(NSString *)string
//                 rangeArray:(NSArray *)rangeArray
//                      color:(UIColor *)color
//{
//    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:string];
//    for (NSString * rangeStr in rangeArray) {
//        [str addAttribute:NSForegroundColorAttributeName value:color range:NSRangeFromString(rangeStr)];
//    }
//    self.attributedText = str;
//}


/**
 *  让label上的字符串的字体颜色发生变化
 *
 *  @param changeStr 需要变化的字符串
 *  @param color     颜色值
 */
- (void)setAttributedChangeStr:(NSString *)changeStr
                      color:(UIColor *)color
{
    NSRange range = [self.text rangeOfString:changeStr];
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:self.text];
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = str;
}
//#pragma mark 计算给定字符串宽度
//- (CGSize)getWidthWithFont:(UIFont *)font height:(float)height
//{
//    CGSize size = [self.text sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, height)];
//    return size;
//}
- (void)setLabelTextAttributeWithBeginLoaction:(NSInteger)begin endLocation:(NSInteger)end fontName:(NSString *)fontName fontSize:(CGFloat)fontSize
{
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(begin,end)];
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName size:fontSize] range:NSMakeRange(begin, end)];
    
    self.attributedText = string;
}

@end

