//
//  Utils.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/9/10.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "Utils.h"
#import "PublicImageDefine.h"
@implementation Utils
/**
 *  根据图片id获取对应的图片UIImage
 *
 *  @param imageId 图片id
 *
 *  @return 图片UIImage
 */
+ (UIImage *)getImageById:(NSString *)imageId directory:(NSString *)directory
{
   	UIImage *image = nil;
    CGFloat scale = 1.0f;
    if([[UIScreen mainScreen] respondsToSelector:@selector(scale)]){
        scale = [[UIScreen mainScreen] scale];
    }
    
    NSString *multiple = @"";
    if (scale > 1.0) {
        NSString *scaleStr = [NSString stringWithFormat:@"%f",scale];
        multiple = [NSString stringWithFormat:@"@%dx",[scaleStr intValue]];
    }
    NSString *imageName = [NSString stringWithFormat:@"%@%@",imageId,multiple];
    
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:RES_IMAGE_BUNDLE];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSString *imagePath = [bundle pathForResource:imageName ofType:IMAGE_FILE_SUFFIX_PNG inDirectory:directory];
    
    image = [UIImage imageWithContentsOfFile:imagePath];
    if (image == nil) {
        image = [UIImage imageNamed:imageId];
    }
    return image;
}
@end
