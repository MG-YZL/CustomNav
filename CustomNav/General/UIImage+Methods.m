//
//  UIImage+Methods.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/9/6.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "UIImage+Methods.h"

@implementation UIImage (Methods)
//- (UIImage *)getImageWithName:(NSString *)imageName
//{
//    NSString * imagePath = [MYBUNDLE_PATH stringByAppendingPathComponent:imageName];
////    return [(UIImage *)self ]
//}

/**
 *  图片变形的抗锯齿处理方法
 *
 *  @return 返回处理好的图片
 */
- (UIImage *)antiAlias
{
    CGFloat border = 1.0f;
    CGRect rect = CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border);
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}



@end
