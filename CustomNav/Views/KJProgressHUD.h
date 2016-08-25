//
//  KJProgressHUD.h
//  MiSiChu
//
//  Created by wangzhen on 15/10/10.
//  Copyright © 2015年 Vision.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KJProgressHUD : UIView

@property (strong, nonatomic) UIView * progressShadowView;              //背景隔板
@property (strong, nonatomic) UIView * progressView;                    //蒙版
@property (strong, nonatomic) UIActivityIndicatorView * progressHud;    //hud 菊花
/**
 *  显示菊花hud的方法
 */
- (void)showProgressHUD;

/**
 *  隐藏菊花hud的方法
 */
- (void)hiddenProgressHUD;

@end
