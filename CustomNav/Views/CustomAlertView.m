//
//  CustomAlertView.m
//  DemoForCander
//
//  Created by guobingwei on 15-3-26.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import "CustomAlertView.h"

@implementation CustomAlertView
@synthesize delegate;
@synthesize baseView;
@synthesize contentView;

/**
 *  初始化界面
 *
 *  @return 界面
 */
- (id)initCustomAlertView
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        
        self.frame = CGRectMake((ScreenWidth-1048.0/3-35)/2, (ScreenHeight-1053.0/3-35)/2, 1048.0/3, 1053/3);
        self.backgroundColor = [UIColor clearColor];
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.contentView.userInteractionEnabled = YES;
        [self addSubview:self.contentView];
        
        self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.closeBtn setFrame:CGRectMake(1048.0/3-35.0/2-40, 40, 35, 35)];
        [self.closeBtn setBackgroundColor:[UIColor clearColor]];
        [self.closeBtn setImage:[UIImage imageNamed:@"icon_activity_clost_btn"] forState:UIControlStateNormal];
        [self.closeBtn addTarget:self action:@selector(closeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.closeBtn];
        
        self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1048.0/3, 1053/3)];
        self.bgImageView.backgroundColor = [UIColor clearColor];
        self.bgImageView.userInteractionEnabled = YES;
        self.bgImageView.image = [UIImage imageNamed:@"bg_eight_activity"];
        [self.contentView addSubview:self.bgImageView];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundImageViewTouchAction)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self.bgImageView addGestureRecognizer:tap];
        
        self.touchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.touchBtn setFrame:CGRectMake((self.bgImageView.frame.size.width-399.0/3)/2, (self.bgImageView.frame.size.height-156.0/3-30), 399.0/3, 156.0/3)];
        [self.touchBtn setBackgroundColor:[UIColor clearColor]];
        [self.touchBtn setImage:[UIImage imageNamed:@"eight_activity_touch_btn"] forState:UIControlStateNormal];
        [self.touchBtn addTarget:self action:@selector(touchBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgImageView addSubview:self.touchBtn];
    }
    return self;
}
/**
 *  背景图点击的方法
 */
- (void)backgroundImageViewTouchAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(touchBtnForAllowance)]) {
        [self.delegate touchBtnForAllowance];
    }
    
    [self dismissAlert];
}
/**
 *  button - 接受的button
 *
 *  @param sender 接受的button
 */
- (void)touchBtnAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(touchBtnForAllowance)]) {
        [self.delegate touchBtnForAllowance];
    }
    
    [self dismissAlert];
}
/**
 *  关闭按钮的管理的方法
 *
 *  @param sender 关闭button
 */
- (void)closeBtnAction:(id)sender
{
    [self dismissAlert];
}

- (void)cancelBtnAction
{
    [self dismissAlert];
}

/**
 *  展示动画效果
 */
- (void)showAlert
{
    self.baseView = [[UIView alloc] init];
    [self.baseView setFrame:[UIScreen mainScreen].bounds];
    [self.baseView setBackgroundColor:[UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.6]];
    [self.baseView setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *cancelGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelGestureAction)];
    cancelGesture.numberOfTapsRequired = 1;
    cancelGesture.numberOfTouchesRequired = 1;
    [self.bgImageView addGestureRecognizer:cancelGesture];
    /**
     *  window
     */
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.baseView];
    [window addSubview:self];
    
    CGRect frame = self.frame;
    frame.origin.x = (self.baseView.frame.size.width-self.frame.size.width)/2;
    frame.origin.y = (self.baseView.frame.size.height-self.frame.size.height)/2;
    self.frame = frame;
    
    self.baseView.alpha = 0.f;
    self.alpha = 0.f;
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
        self.alpha = 1.f;
        self.baseView.alpha = 1.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}
/**
 *  移除动画
 */
- (void)dismissAlert
{
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.alpha = 0.f;
        self.baseView.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self.baseView removeFromSuperview];
    }];
}
/**
 *  蒙版背景管理的方法
 */
- (void)cancelGestureAction
{
    [self dismissAlert];
}
///**
// *  <#Description#>
// *
// *  @param tap <#tap description#>
// */
//- (void)tapGestureAction:(UITapGestureRecognizer *)tap
//{
//    [self dismissAlert];
//}


@end
