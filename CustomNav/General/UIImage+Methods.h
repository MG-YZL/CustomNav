//
//  UIImage+Methods.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/9/6.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Methods)
//- (UIImage *)getImageWithName:(NSString *)imageName;

/**
 *  图片变形的抗锯齿处理方法
 *
 *  @return 返回处理好的图片
 */
- (UIImage *)antiAlias;

@end
