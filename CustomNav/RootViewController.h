//
//  RootViewController.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/19.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabbarViewController.h"
@class DetailPageViewController,HomeViewController;
@interface RootViewController : UITabBarController;
@property (nonatomic, strong)DetailPageViewController * detailVC;
@property (nonatomic, strong)HomeViewController * homeVC;




@end
