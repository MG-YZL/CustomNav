//
//  ToolKit.h
//  KP_iOS
//
//  Created by 杨宗磊 on 15/10/20.
//  Copyright (c) 2015年 杨宗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolKit : NSObject
/**
 *  验证手机号码
 *
 *  @param mobileNum 手机号码
 *
 *  @return 验证结果
 */
+ (BOOL) isMobileNumber:(NSString*)mobileNum;

/**
 *  检查字符串是否为空
 *
 *  @param astring 检测的字符串
 *
 *  @return 检测的结果
 */
+ (BOOL)checkStringIsNil:(NSString *)astring;

/** 设置视图圆角 */
+ (void)setViewRadius:(CGFloat)radius toView:(UIView *)view;
@end
