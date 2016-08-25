//
//  ToolKit.m
//  KP_iOS
//
//  Created by 杨宗磊 on 15/10/20.
//  Copyright (c) 2015年 杨宗磊. All rights reserved.
//

#import "ToolKit.h"

@implementation ToolKit
/**
 *  验证手机号码
 *
 *  @param mobileNum 手机号码
 *
 *  @return 验证结果
 */
+ (BOOL) isMobileNumber:(NSString*)mobileNum
{
    /**
     *
     手机号码
     *
     移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     *
     联通：130,131,132,152,155,156,185,186
     *
     电信：133,1349,153,180,189
     */
    
    NSString*
    MOBILE=
    @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    /**
     *
     中国移动：China Mobile
     *
     134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    
    NSString*
    CM=
    @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     *
     中国联通：China Unicom
     *
     130,131,132,152,155,156,185,186
     */
    
    NSString*
    CU=
    @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    /**
     
     *
     中国电信：China Telecom
     
     *
     133,1349,153,180,189
     
     */
    
    NSString*
    CT=
    @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    /**
     
     *
     大陆地区固话及小灵通
     
     *
     区号：010,020,021,022,023,024,025,027,028,029
     
     *
     号码：七位或八位
     
     */
    
    //
    //NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    
    
    NSPredicate*regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILE];
    
    NSPredicate*regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM];
    
    NSPredicate*regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU];
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT];
    
    if(([regextestmobile evaluateWithObject:mobileNum] == YES)||([regextestcm evaluateWithObject:mobileNum] == YES)||([regextestct evaluateWithObject:mobileNum]== YES)||([regextestcu evaluateWithObject:mobileNum]== YES)) {
        
        return YES;
        
    } else {
        
        return NO;
    }
}
/**
 *  检查字符串是否为空
 *
 *  @param astring 检测的字符串
 *
 *  @return 检测的结果
 */
+ (BOOL)checkStringIsNil:(NSString *)astring
{
    BOOL isNil = NO;
    if (astring == nil || [@"" isEqualToString:astring] || [[NSNull null] isEqual:astring] || [@"<null>" isEqualToString:astring] || [@"(null)" isEqualToString:astring]) {
        isNil = YES;
    }
    
    return isNil;
}

#pragma mark - 关于绘图方法

/** 设置视图圆角 */
+ (void)setViewRadius:(CGFloat)radius toView:(UIView *)view {
    [self setViewRadius:radius borderWidth:0 borderColor:nil toView:view];
}

/**
 设置视图圆角、边框、边框颜色
 view:需要添加圆角和边框的视图，必须有
 radius:圆角半径，必须有，0：没有半径
 width:边框半径，必须有，0：没有边框
 color:边框颜色，可以nil，默认黑色
 */
+ (void)setViewRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)color toView:(UIView *)view {
    if (!view || ![view isKindOfClass:[UIView class]]) return;  // 视图判断
    
    // 半径判断
    if (radius > 0) {
        [view.layer setMasksToBounds:YES];
        [view.layer setCornerRadius:radius]; // 设置圆角半径
    }else {
        [view.layer setMasksToBounds:NO];
        [view.layer setCornerRadius:0];
    }
    
    // 宽度判断
    if (width > 0) { // 边框宽度和颜色
        [view.layer setBorderWidth:width];  // 设置边框宽度
        
        UIColor *borderColor = color;       // 边框颜色
        UIColor * color = RGB(51, 51, 51);
        borderColor = color?color:color;
        
        [view.layer setBorderColor:[borderColor CGColor]];  // 设置边框颜色
    }else {
        [view.layer setBorderWidth:0];  // 设置边框宽度
        [view.layer setBorderColor:nil];  // 设置边框颜色
    }
}

@end
