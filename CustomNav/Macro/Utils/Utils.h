//
//  Utils.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/9/10.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
/**
 *  根据图片id获取对应的图片UIImage
 *
 *  @param imageId 图片id
 *
 *  @return 图片UIImage
 */
+ (UIImage *)getImageById:(NSString *)imageId directory:(NSString *)directory;
@end
