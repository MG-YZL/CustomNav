//
//  CustomAlertView.h
//  DemoForCander
//
//  Created by guobingwei on 15-3-26.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol CustomAlertViewDelegate;
@protocol CustomAlertViewDelegate <NSObject>
/**
 *  点击方法
 */
- (void)touchBtnForAllowance;

@end

@interface CustomAlertView : UIView

@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *touchBtn;

@property (nonatomic, weak) id<CustomAlertViewDelegate>delegate;
/**
 *  背景图点击的方法
 */
- (void)backgroundImageViewTouchAction;
/**
 *  初始化界面
 *
 *  @return 界面
 */
- (id)initCustomAlertView;
/**
 *  展示动画效果
 */
- (void)showAlert;

/**
 *  移除动画
 */
- (void)dismissAlert;

@end

