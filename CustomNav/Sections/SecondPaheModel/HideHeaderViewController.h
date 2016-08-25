//
//  HideHeaderViewController.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/20.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReplyCell.h"
#import "EvalInputContentView.h"

@interface HideHeaderViewController : CustomNavigationController<UITableViewDataSource, UITableViewDelegate,replyActionDelegate>
@property (nonatomic, strong)UIImageView * navgationBgImageView;   //导航栏的背景图片
@property (nonatomic, strong)UIImageView * bgImageView;   //背景图

@property (nonatomic, strong)UIButton * backBtn;
@property (nonatomic, strong)UILabel * titileLable;
@property (nonatomic, strong)UIButton * shareBtn;


@property (nonatomic, strong)EvalInputContentView * evalContentView;



@end
