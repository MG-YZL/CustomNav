//
//  JQBounceSpot1Animation.h
//  JQIndicatorViewDemo
//
//  Created by James on 15/7/21.
//  Copyright (c) 2015年 JQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JQIndicatorAnimationProtocol <NSObject>

- (void)configAnimationAtLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size;
- (void)removeAnimation;

@end

@interface JQBounceSpot1Animation : NSObject <JQIndicatorAnimationProtocol>



@end
