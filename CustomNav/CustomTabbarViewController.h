//
//  CustomTabbarViewController.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/19.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabbarViewController : UITabBarController
@property (nonatomic, strong)UIImageView * backIamgeView;
@property (nonatomic, strong)UILabel * backTitleLable;
@property (nonatomic, strong)UIButton * navBackBtn;

@property (nonatomic, strong)UILabel * navTitleLable;

@property (nonatomic, strong)UIButton * navRightBtn;
@property (nonatomic, strong)UILabel * navRightTitleLable;
@property (nonatomic, strong)UIImageView * navRightImageView;

@property (nonatomic, assign)BOOL isShowBackImageView;   //是否显示返回按钮
@property (nonatomic, assign)BOOL isShowBackTitleLable;  //是否显示返回文本

@end
