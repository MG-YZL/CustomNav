//
//  NSString+Methods.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/28.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Methods)
/**
 *  计算给定字符串宽度
 *
 *  @param font   给定字符串的字体大小
 *  @param height 展示给定字符串的Label高度
 *
 *  @return 给定字符串的CGSize
 */
- (CGSize)getWidthWithFont:(UIFont *)font height:(float)height;

/**
 *  根据图片名字获得图片的路径
 *
 *  @param imageName 图片的名字
 *
 *  @return 图片当前的路径
 */
- (NSString *)getImagePathWithImageName:(NSString *)imageName;

@end
